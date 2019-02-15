import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:peddi_tont_app/models/body/ask_order_body.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class LoadRestaurantAction {}

class NewItemList {}

class Success {}

class SaveRestaurantAction {
  final Restaurant restaurant;

  SaveRestaurantAction(this.restaurant);
}

class AskOrderAction {
  final AskOrderBody order;
  final Completer completer;

  AskOrderAction(this.order, this.completer);
}

class OrderSentSuccessfully {
  final String orderId;

  OrderSentSuccessfully(this.orderId);
}

class OrderNotSentSuccessfully {}

class OpenOrderAction {
  final int table;
  final int guests;

  OpenOrderAction(this.table, this.guests);
}

class EndOrderAction {
  final String orderId;
  final Completer completer;

  EndOrderAction(this.orderId, this.completer);
}

class AddQrResposibleCode {
  final String qrCode;
  final String orderId;
  final Completer completer;

  AddQrResposibleCode(this.qrCode, this.orderId, this.completer);
}

class AddQrTicketCode {
  final String qrCode;
  final Completer completer;

//  final BuildContext context;

  AddQrTicketCode(
    this.qrCode,
//      this.context,
    this.completer,
  );
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
