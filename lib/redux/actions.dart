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

class AddTableNumberOrderAction {
  final String table;
  final String customers;

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
