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
  } else if (action is SaveRestaurantAction) {
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
        amount: 0.0,
        restaurant: new RestaurantOrder(
            cnpj: state.restaurant.cnpj, name: state.restaurant.name),
      ));
}

AppState addItem(AppState state, AddItemAction action) {

  Order addItemToOrder(AddItemAction action) {
    state.order.items.add(action.item);
    state.order.amount += action.item.amount;
    return state.order;
  }
  return new AppState(state.restaurant, addItemToOrder(action));
}

AppState removeItem(AppState state, RemoveItemAction action){
  Order removeItemFromOrder(RemoveItemAction action) {
    state.order.items.remove(action.item);
    state.order.amount -= action.item.amount;
    return state.order;
  }
  return new AppState(state.restaurant, removeItemFromOrder(action));
}
