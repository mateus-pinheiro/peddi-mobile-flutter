import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';
import 'package:peddi_tont_app/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is LoadRestaurantAction) {
    return loadRestaurant(action, state.restaurant);
  } else if (action is AddItemAction) {
    return addItem(state, action);
  } else if (action is AddTableNumberOrderAction) {
    return addTableNumberOrder(action, state);
  }
//  else if (action is AddItemIngredients) {
//    return addItemIngredients(action, state);
//  }
//  else if (action is LoadRestaurantFromPrefs) {
//    return loadRestaurantFromPrefs(action);
//  }
  else if (action is SaveRestaurantAction) {
    return saveRestaurant(action, state);
  }
  return state;
}

AppState loadRestaurant(LoadRestaurantAction action, Restaurant restaurant) {
  return new AppState(restaurant, null);
}

AppState saveRestaurant(SaveRestaurantAction action, AppState state) {
  return new AppState(action.restaurant, state.order);
}

AppState addTableNumberOrder(AddTableNumberOrderAction action, AppState state) {
  return new AppState(
      state.restaurant,
      new Order(
        status: true,
        table: action.table,
        customers: action.customers,
        createdAt: DateTime.now(),
        items: new List<Item>(),
        restaurant: new RestaurantOrder(
            cnpj: state.restaurant.cnpj, name: state.restaurant.name),
      ));
}

AppState addItem(AppState state, AddItemAction action) {
  Order addItemToOrder(AddItemAction action) {
    state.order.items.add(action.item);
    return state.order;
  }

  return new AppState(state.restaurant, addItemToOrder(action));
}

//AppState addItemIngredients(AddItemIngredients action, AppState state) {
//  Order addItemIng(Item item, AppState state) {
////    item.ingredients.add(action.ingredient);
//
//    if (state.order.items.isEmpty) {
//      state.order.items.add(item);
//    } else {
//      state.order.items.map((item) => item == action.item ? action.item : item);
//    }
//
//    return state.order;
//  }
//
//  return new AppState(state.restaurant, addItemIng(action.item, state));
//}

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
