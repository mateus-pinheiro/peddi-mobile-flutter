import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class LoadRestaurantAction {}

class SaveRestaurantAction {
  final Restaurant restaurant;

  SaveRestaurantAction(this.restaurant);
}

class SendOrder {
  final Order order;

  SendOrder(this.order);
}

class AddTableNumberOrderAction {
  final int table;
  final int customers;

  AddTableNumberOrderAction(this.table, this.customers);
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
