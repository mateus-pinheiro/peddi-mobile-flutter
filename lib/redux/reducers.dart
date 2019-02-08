import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/consumer.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:peddi_tont_app/models/restaurant_order.dart';
import 'package:peddi_tont_app/models/waiter.dart';
import 'package:peddi_tont_app/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is LoadRestaurantAction) {
    return loadRestaurant(action, state.restaurant);
  } else if (action is SaveRestaurantAction) {
    return saveRestaurant(action, state);
  } else if (action is SendOrder) {
    return sendOrder(action, state);
  }
//  else if (action is OrderSentSuccessfully) {
//    return orderSent(action, state);
//  } else if (action is OrderNotSentSuccessfully) {
//    return orderNotSent(action, state);
//  }
  else if (action is AddQrTicketCode) {
    return addConsumerCode(action, state);
  } else if (action is NewItemList) {
//    return newItemList(state);
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
  return new AppState(restaurant, null);
}

AppState saveRestaurant(SaveRestaurantAction action, AppState state) {
  return new AppState(action.restaurant, state.order);
}

AppState sendOrder(SendOrder action, AppState state) {
  return new AppState(state.restaurant, action.order);
}

//AppState orderSent(OrderSentSuccessfully action, AppState state) {
//  return new AppState(state.restaurant, state.order);
//}
//
//AppState orderNotSent(OrderNotSentSuccessfully action, AppState state) {
//  return new AppState(state.restaurant, state.order);
//}

AppState addConsumerCode(AddQrTicketCode action, AppState state) {
  List<Consumer> addConsumerToOrder(AddQrTicketCode action) {
    var consumer = new Consumer();
    consumer.card = state.order.table;
    state.order.consumers.add(consumer);
    return state.order.consumers;
  }

  return new AppState(
      state.restaurant,
      state.order.copyWith(consumers: addConsumerToOrder(action)));
}

//AppState newItemList(AppState state) {
//  return new AppState(
//      state.restaurant,
//      state.order.copyWith(
//        items: new List<Item>(),
//        amountPrice: 0.0,
//        ticket: '',
//      ));
//}

AppState addQrResposibleCode(AddQrResposibleCode action, AppState state) {

  var waiter;
  if (action.qrCode.isNotEmpty) {
    state.restaurant.waiters.where((f) => f.mgmtId == action.qrCode).isNotEmpty
        ? action.completer.complete()
        : action.completer
            .completeError('Não existe nenhum garçom com esse código.');

    waiter = state.restaurant.waiters
        .singleWhere((i) => i.mgmtId == action.qrCode);
  } else {
    waiter = new Waiter();
  }

  return new AppState(
      state.restaurant,
      state.order.copyWith(
          id: action.orderId,
          restaurantCloudId: state.restaurant.restaurantCloudId,
          waiter: waiter));
}

AppState addTableNumberOrder(AddTableNumberOrderAction action, AppState state) {
  return new AppState(
      state.restaurant,
      new Order(
          status: 1,
          amountPrice: null,
          table: action.table,
          guests: action.guests,
          restaurantCloudId: state.restaurant.restaurantCloudId,
          waiter: null,
          createdAt: DateTime.now(),
          updatedAt: null,
          consumers: new List<Consumer>()));
}

AppState addItem(AddItemAction action, AppState state) {
  Order addItemToOrder(AddItemAction action) {

    var consumer = Consumer(items: new List<Item>());
    if (state.order.consumers.length < 1) {
      consumer.card = state.order.table;
      consumer.items.add(action.item);
      state.order.consumers.add(consumer);
    } else {
      state.order.consumers[0].items.add(action.item);
    }

    if (state.order.amountPrice == null) state.order.amountPrice = 0.0;
    state.order.amountPrice += action.item.amount;
    return state.order;
  }

  return new AppState(state.restaurant, addItemToOrder(action));
}

AppState removeItem(RemoveItemAction action, AppState state) {
  Order removeItemFromOrder(RemoveItemAction action) {
    state.order.consumers[0].items.remove(action.item);
    state.order.amountPrice -= action.item.amount;
    return state.order;
  }

  return new AppState(state.restaurant, removeItemFromOrder(action));
}
