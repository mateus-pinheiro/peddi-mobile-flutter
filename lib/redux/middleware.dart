import 'dart:async';
import 'dart:convert';

import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:peddi_tont_app/services/api.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
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
  } else if (action is SendOrder){
    sendOrderToApi(store.state.order);
  }

//  if (action is SaveRestaurantAction) {
//    saveStateToPrefs(store.state);
//  }
}

void sendOrderToApi(Order order){
  try {
    API().postOrder(order).then((response) => response);
  } catch (E){
    E.toString();
  }
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
