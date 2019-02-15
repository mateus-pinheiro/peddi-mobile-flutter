import 'dart:async';
import 'dart:convert';

import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/response/response_open_order.dart';
import 'package:peddi_tont_app/services/api.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_STATE_KEY = "APP_STATE";

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  if (action is LoadRestaurantAction) {
    API().getRestaurant().then((restaurant) {
      store.dispatch(new SaveRestaurantAction(restaurant));
    });
  } else if (action is AskOrderAction) {
    sendOrderToApi(store, action);
//    store.dispatch(new NewItemList());
  } else if (action is OpenOrderAction) {
    openOrder(store, action);
  } else if (action is EndOrderAction) {
    endOrder(store, action);
  }
//  else if (action is AddQrTicketCode) {
//    store.dispatch(SendOrder(store.state.order, snackBarCompleter(action.context, null, shouldPop: false)));
//  }
//  if (action is SaveRestaurantAction) {
//    saveStateToPrefs(store.state);
//  }
}

void openOrder(Store<AppState> store, OpenOrderAction action) {
  API().openOrder(store.state.order).then((response) {
    store.dispatch(new AddQrResposibleCode("", response.id, null));
  }).catchError((error) => error.toString());
}

void endOrder(Store<AppState> store, EndOrderAction action) {
  API().endOrder(action.orderId).then((response) {
    action.completer.complete();
  }).catchError((error) => action.completer.completeError(error));
}

void sendOrderToApi(Store<AppState> state, AskOrderAction action) {
  API().askOrder(action.order).then((response) {
    action.completer.complete();
    state.dispatch(new NewItemList());
  }).catchError((Object error) {
    action.completer.completeError(error);
  });
}

void saveStateToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = json.encode(state.toJson());
  await preferences.setString(APP_STATE_KEY, stateString);
}

Future<AppState> loadStateFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = preferences.getString(APP_STATE_KEY);
  Map stateMap = json.decode(stateString);
  return new AppState.fromJson(stateMap);
}
