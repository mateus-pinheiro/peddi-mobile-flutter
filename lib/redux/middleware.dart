import 'dart:async';
import 'dart:convert';

import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/response/response_error_send_product.dart';
import 'package:peddi_tont_app/models/response/response_open_order.dart';
import 'package:peddi_tont_app/services/api.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/util/completers.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_STATE_KEY = "APP_STATE";

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  if (action is LoadRestaurantAction) {
    loadRestaurant(store, action);
  } else if (action is AskOrderAction) {
    sendOrderToApi(store, action);
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
    store.dispatch(new AddQrResposibleCode(
        null,
        response.id,
        loginFlow(
          action.context,
          "Bem vindo!",
        )));
  }).catchError((error) => error.toString());
}

void endOrder(Store<AppState> store, EndOrderAction action) {
  API().endOrder(action.orderId).then((response) {
    action.completer.complete();
  }).catchError((error) => action.completer.completeError(error));
}

void sendOrderToApi(Store<AppState> store, AskOrderAction action) {
  List<Item> itemNotSentList = new List<Item>();
  API().askOrder(action.order).then((response) {
    action.completer.complete();
    store.dispatch(new NewItemListAction(items: itemNotSentList));
  }).catchError((error) {
    if (error != null) {
      List<ResponseErrorSendProduct> responseBody =
          (json.decode(error.message.body) as List)
              .map((e) => new ResponseErrorSendProduct.fromJson(e))
              .toList();

      if (responseBody.length > 0) {
        responseBody.forEach((productNotSent) => store
            .state.order.consumers[0].items
            .forEach((item) => item.baseCloudId == productNotSent.cloudId
                ? itemNotSentList.add(item)
                : ""));
      }
    }

    action.completer.completeError(error);
    store.dispatch(new NewItemListAction(items: itemNotSentList));
  });
}

void loadRestaurant(Store<AppState> store, LoadRestaurantAction action) {
  API().getRestaurant().then((restaurant) {
    store.dispatch(new SaveRestaurantAction(restaurant));
    store.dispatch(new OpenOrderAction(action.context, action.table, action.guests));
  }).catchError((error) => error);
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
