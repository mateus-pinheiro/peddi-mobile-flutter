import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/restaurant.dart';

class LoadRestaurant {}

class SaveRestaurant {
  final Restaurant restaurant;

  SaveRestaurant(this.restaurant);
}

class AddTableNumberOrder {
  final String table;
  final String customers;

  AddTableNumberOrder(this.table, this.customers);
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
