import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
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

class AddItemIngredients {
  final Item item;
  final Ingredient ingredient;

  AddItemIngredients(this.ingredient, this.item);
}

//class LoadRestaurantFromPrefs {
//  final Restaurant restaurant;
//  LoadRestaurantFromPrefs(this.restaurant);
//}
//
//class SaveCategories {
//  final List<Category> categories;
//  SaveCategories(this.categories);
//}
