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
  } else if (action is AskOrderAction) {
    return askOrder(action, state);
  } else if (action is EndOrderAction) {
    return endOrder(action, state);
  } else if (action is AddQrTicketCode) {
    return addConsumerCode(action, state);
  } else if (action is NewItemList) {
    return newItemList(state);
  } else if (action is AddQrResposibleCode) {
    return addQrResposibleCode(action, state);
  } else if (action is OpenOrderAction) {
    return openOrder(action, state);
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

AppState askOrder(AskOrderAction action, AppState state) {
  return new AppState(state.restaurant, state.order.copyWith(status: 2));
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

  return new AppState(state.restaurant,
      state.order.copyWith(consumers: addConsumerToOrder(action)));
}

AppState newItemList(AppState state) {
  List<Consumer> consumerList(List<Consumer> consumerList) {
//    consumerList.elementAt(0).copyWith(items: new List<Item>());
    consumerList.first.items = new List<Item>();
    return consumerList;
  }

  return new AppState(
      state.restaurant,
      state.order.copyWith(
          amountPrice: 0.0, consumers: consumerList(state.order.consumers)));
}

AppState addQrResposibleCode(AddQrResposibleCode action, AppState state) {
  var waiter;
  var orderId = action.orderId;
  if (action.qrCode.isNotEmpty) {
    if (state.restaurant.waiters != null) {
      state.restaurant.waiters
              .where((f) => f.qrCode == action.qrCode)
              .isNotEmpty
          ? action.completer.complete()
          : action.completer
              .completeError('Não existe nenhum garçom com esse código.');

      waiter = state.restaurant.waiters
          .singleWhere((i) => i.qrCode == action.qrCode);
    } else {
      action.completer.completeError('Não existe nenhum garçom cadastrado');
    }
  } else {
    waiter = new Waiter();
  }

  return new AppState(
      state.restaurant,
      state.order.copyWith(
          id: orderId,
          restaurantCloudId: state.restaurant.restaurantCloudId,
          waiter: waiter));
}

AppState openOrder(OpenOrderAction action, AppState state) {
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

AppState endOrder(EndOrderAction action, AppState state) {
  return new AppState(state.restaurant, new Order());
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
