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
  } else if (action is NewItemListAction) {
    return newItemList(action, state);
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
    consumer.card = state.order.table.toString();
    state.order.consumers.add(consumer);
    return state.order.consumers;
  }

  return new AppState(state.restaurant,
      state.order.copyWith(consumers: addConsumerToOrder(action)));
}

AppState newItemList(NewItemListAction action, AppState state) {
  var amountPrice;
  List<Consumer> consumerList(List<Consumer> consumerList) {
    if (action.items != null && action.items.length > 0) {
      consumerList.first.items = action.items;
      action.items.every((item) => amountPrice += (item.itemPrice * item.qtyItem));
    } else {
      consumerList.first.items = new List<Item>();
      amountPrice = 0.0;
    }
    return consumerList;
  }

  return new AppState(
      state.restaurant,
      state.order.copyWith(
          consumers: consumerList(state.order.consumers),
          amountPrice: amountPrice
      ));
}

AppState addQrResposibleCode(AddQrResposibleCode action, AppState state) {
  var waiter;
  var orderId = action.orderId;
  if (action.orderId == null) {
    action.completer.completeError("");
  } else {
    action.completer.complete();
  }
//  if (action.qrCode.isNotEmpty) {
//    if (state.restaurant.waiters != null) {
//      state.restaurant.waiters
//              .where((f) => f.qrCode == action.qrCode)
//              .isNotEmpty
//          ? action.completer.complete()
//          : action.completer
//              .completeError('Não existe nenhum garçom com esse código.');
//
//      waiter = state.restaurant.waiters
//          .singleWhere((i) => i.qrCode == action.qrCode);
//    } else {
//      action.completer.completeError('Não existe nenhum garçom cadastrado');
//    }
//  } else {
//    waiter = new Waiter();
//  }

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
    if (state.order.productAddedCounter == null)
      state.order.productAddedCounter = 0;
    state.order.productAddedCounter += 1;
    var consumer = Consumer(items: new List<Item>());
    if (state.order.consumers.length < 1) {
      consumer.card = state.order.table.toString();
      consumer.items.add(action.item);
      state.order.consumers.add(consumer);
    } else {
      consumer = state.order.consumers[0];
      state.order.consumers[0].items.add(action.item);
    }

    if (state.order.amountPrice == null) state.order.amountPrice = 0.0;
    state.order.amountPrice += action.item.itemPrice;

    if (action.item.qtyItem > 1)
      consumer.items
          .singleWhere((item) => item == action.item && item.qtyItem > 1)
          .itemPrice = action.item.itemPrice / action.item.qtyItem;

    if (state.order.productAddedCounter < 3)
      action.completer.complete();

    return state.order;
  }

  return new AppState(state.restaurant, addItemToOrder(action));
}

AppState removeItem(RemoveItemAction action, AppState state) {
  Order removeItemFromOrder(RemoveItemAction action) {
    var totalPriceOfItem;
    if (action.item.qtyItem > 1) {
      totalPriceOfItem = action.item.itemPrice * action.item.qtyItem;
    } else {
      totalPriceOfItem = action.item.itemPrice;
    }

    state.order.consumers[0].items.remove(action.item);
    state.order.amountPrice -= totalPriceOfItem;
    return state.order;
  }

  return new AppState(state.restaurant, removeItemFromOrder(action));
}
