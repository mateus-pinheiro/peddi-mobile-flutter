import 'dart:async';
import 'dart:convert';

import 'package:peddi_tont_app/services/api.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String RESTAURANT_KEY = "RESTAURANT_APP";
const String CATEGORY_KEY = "CATEGORY_APP";
const String SUB_CATEGORY_KEY = "SUB_CATEGORY_APP";

//const String CATEGORY_KEY = "CATEGORY_APP";
//const String CATEGORY_KEY = "CATEGORY_APP";

const String APP_STATE_KEY = "APP_STATE";

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  if (action is LoadRestaurantAction) {
    API().getRestaurant().then((restaurant) {
      store.dispatch(new SaveRestaurantAction(restaurant));
    });
  }

  if (action is SaveRestaurantAction) {
    saveStateToPrefs(store.state);
    saveCategoriesToPrefs(store.state.restaurant.categories);
  }

//  if (action is AddTableNumberOrder) {
//
//  }

//  if (action is LoadRestaurantFromPrefs) {
//    loadStateFromPrefs().then((store) {
//      return (store.restaurant);
//    });
//  }
//
//  if (action is SaveCategories) {
//    saveCategoriesToPrefs(store.state.restaurant.categories);
//  }



//  if (action is AddItemAction ||
//      action is ToggleItemStateAction ||
//      action is RemoveItemAction) {
//    saveStateToPrefs(store.state);
//  }
//
//  if (action is FetchItemsAction) {
//    loadStateFromPrefs().then((state) {
//      store.dispatch(new ItemLoadedAction(state.cartItems));
//    });
//  }
}

void saveCategoriesToPrefs(List<Category> categories) async {
  SharedPreferences mSharedPreferences = await SharedPreferences.getInstance();
  String categoriesString = json.encode(categories);
  await mSharedPreferences.setString(CATEGORY_KEY, categoriesString);
}

//
void saveStateToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = json.encode(state.toJson());
  await preferences.setString(APP_STATE_KEY, stateString);
}
//
Future<AppState> loadStateFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = preferences.getString(APP_STATE_KEY);
  Map stateMap = json.decode(stateString);
  return new AppState.fromJson(stateMap);
}
