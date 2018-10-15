import 'dart:async';
import 'dart:convert';

import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/rating.dart';
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
  } else if (action is SendOrder) {
    sendOrderToApi(store.state.order, store, action);
    store.dispatch(new NewItemList());
  } else if (action is SendRating) {}
//  else if (action is AddQrTicketCode) {
//    store.dispatch(SendOrder(store.state.order, snackBarCompleter(action.context, null, shouldPop: false)));
//  }
//  if (action is SaveRestaurantAction) {
//    saveStateToPrefs(store.state);
//  }
}

void sendOrderToApi(Order order, Store<AppState> state, SendOrder action) {
  API().postOrder(order).then((response) {
//    state.dispatch(OrderSentSuccessfully(response.body));
    if (action.completer != null) {
      action.completer.complete();
    }
  }).catchError((Object error) {
    print(error);
//    state.dispatch(OrderNotSentSuccessfully);
    if (action.completer != null) {
      action.completer.completeError(error);
    }
  });
}

void sendRatingToApi(Rating rating, SendRating action) {
  API().postRating(rating).then((response) {
    if (action.completer != null) {
      action.completer.complete();
    }
  }).catchError((Object error) {
    print(error);
//    state.dispatch(OrderNotSentSuccessfully);
    if (action.completer != null) {
      action.completer.completeError(error);
    }
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
