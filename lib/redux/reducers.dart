import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';
import 'package:peddi_tont_app/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is LoadRestaurantAction) {
    return loadRestaurant(action, state.restaurant);
  } else if (action is SaveRestaurantAction) {
    return saveRestaurant(action, state);
  } else if (action is SendOrder) {
    return sendOrder(action, state);
  } else if (action is SendRating) {
  }
//  else if (action is OrderSentSuccessfully) {
//    return orderSent(action, state);
//  } else if (action is OrderNotSentSuccessfully) {
//    return orderNotSent(action, state);
//  }
  else if (action is AddQrTicketCode) {
    return addQrTicketCode(action, state);
  } else if (action is NewItemList) {
    return newItemList(state);
  } else if (action is AddQrResposibleCode) {
    return addQrResposibleCode(action, state);
  } else if (action is AddTableNumberOrderAction) {
    return addTableNumberOrder(action, state);
  } else if (action is AddItemAction) {
    return addItem(action, state);
  } else if (action is RemoveItemAction) {
    return removeItem(action, state);
  }
  return state;
}

AppState loadRestaurant(LoadRestaurantAction action, Restaurant restaurant) {
  return new AppState(restaurant, null, null);
}

AppState saveRestaurant(SaveRestaurantAction action, AppState state) {
  return new AppState(action.restaurant, state.order, null);
}

AppState sendOrder(SendOrder action, AppState state) {
  return new AppState(state.restaurant, action.order, null);
}

//AppState orderSent(OrderSentSuccessfully action, AppState state) {
//  return new AppState(state.restaurant, state.order);
//}
//
//AppState orderNotSent(OrderNotSentSuccessfully action, AppState state) {
//  return new AppState(state.restaurant, state.order);
//}

AppState addQrTicketCode(AddQrTicketCode action, AppState state) {
  return new AppState(
      state.restaurant, state.order.copyWith(ticket: action.qrCode), null);
}

AppState newItemList(AppState state) {
  return new AppState(
      state.restaurant,
      state.order.copyWith(
        items: new List<Item>(),
        amount: 0.0,
        ticket: '',
      ),
      null);
}

AppState addQrResposibleCode(AddQrResposibleCode action, AppState state) {
  state.restaurant.responsibleEmployee
          .where((f) => f.epocId == action.qrCode)
          .isNotEmpty
      ? action.completer.complete()
      : action.completer
          .completeError('Não existe nenhum garçom com esse código.');

  return new AppState(
      state.restaurant,
      state.order.copyWith(
          restaurant: new RestaurantOrder(
              cnpj: state.restaurant.cnpj.toString(),
              name: state.restaurant.name),
          responsibleEmployee: state.restaurant.responsibleEmployee
              .singleWhere((i) => i.epocId == action.qrCode)),
      null);
}

AppState addTableNumberOrder(AddTableNumberOrderAction action, AppState state) {
  return new AppState(
      state.restaurant,
      new Order(
          status: "ABERTO",
          table: action.table,
          customers: action.customers,
          createdAt: DateTime.now(),
          items: new List<Item>()),
      null);
}

AppState addItem(AddItemAction action, AppState state) {
  Order addItemToOrder(AddItemAction action) {
    state.order.items.add(action.item);
    if (state.order.amount == null) state.order.amount = 0.0;
    state.order.amount += action.item.amount;
    return state.order;
  }

  return new AppState(state.restaurant, addItemToOrder(action), null);
}

AppState removeItem(RemoveItemAction action, AppState state) {
  Order removeItemFromOrder(RemoveItemAction action) {
    state.order.items.remove(action.item);
    state.order.amount -= action.item.amount;
    return state.order;
  }

  return new AppState(state.restaurant, removeItemFromOrder(action), null);
}

AppState sendRating(SendRating action, AppState state) {
  return new AppState(state.restaurant, state.order, action.rating);
}
