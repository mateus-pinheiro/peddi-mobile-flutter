import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class LoadRestaurantAction {}
class NewItemList {}

class SaveRestaurantAction {
  final Restaurant restaurant;

  SaveRestaurantAction(this.restaurant);
}

class SendOrder {
  final Order order;
  final Completer completer;

  SendOrder(this.order, this.completer);
}

class OrderSentSuccessfully {
  final String orderId;

  OrderSentSuccessfully(this.orderId);
}

class OrderNotSentSuccessfully {}

class AddTableNumberOrderAction {
  final int table;
  final int customers;

  AddTableNumberOrderAction(this.table, this.customers);
}

class AddQrResposibleCode {
  final String qrCode;
  final Completer completer;

  AddQrResposibleCode(this.qrCode, this.completer);
}

class AddQrTicketCode {
  final String qrCode;
  final BuildContext context;

  AddQrTicketCode(this.qrCode, this.context);
}

class AddItemAction {
  final Item item;

  AddItemAction(this.item);
}

class RemoveItemAction {
  final Item item;

  RemoveItemAction(this.item);
}

class AddItemIngredients {
  final Item item;

  AddItemIngredients(this.item);
}
