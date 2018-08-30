import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:peddi_tont_app/redux/actions.dart';




AppState appStateReducers(AppState state, dynamic action) {
  if (action is LoadRestaurantAction) {
    return loadRestaurant(action, state.restaurant);
  }
  else if (action is AddTableNumberOrderAction){
    return addTableNumberOrder(action, state);
  }
  else if (action is AddItemIngredients){
    return ();
  }
//  else if (action is LoadRestaurantFromPrefs) {
//    return loadRestaurantFromPrefs(action);
//  }
  else if (action is SaveRestaurantAction) {
    return saveRestaurant(action);
  }
  return state;
}

AppState loadRestaurant(LoadRestaurantAction action, Restaurant restaurant) {
  return new AppState(restaurant, new Order());
}

AppState saveRestaurant(SaveRestaurantAction action) {
  return new AppState(action.restaurant, new Order());
}

AppState addTableNumberOrder(AddTableNumberOrderAction action, AppState state) {
  return new AppState(state.restaurant, new Order(table: action.table, customers: action.customers, createdAt: DateTime.now()));
}

AppState addItemIngredients(AddItemIngredients action, AppState state) {
  state.order.products;
  return new AppState(state.restaurant, state.order);
}




//AppState loadRestaurantFromPrefs(LoadRestaurantFromPrefs action) {
//  return new AppState(action.restaurant);
//}

//AppState loadCategories(List<Category> categories, LoadCategories action) {
////  return new AppState(List.from(restaurant.categories));
//  return null;
//}

//AppState addItem(List<CartItem> items, AddItemAction action) {
//  return new AppState(List.from(items)..add(action.item));
//}
//
//AppState toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
//  return new AppState(
//      items.map((item) => item.name == action.item.name ? action.item : item).toList());
//}
//
//AppState removeItem(List<CartItem> items, RemoveItemAction action) {
//  return new AppState(
//      List.from(items)..removeWhere((item) => item.name == action.item.name));
//}
//
//AppState loadItems(ItemLoadedAction action) {
//  return new AppState(action.items);
//}
