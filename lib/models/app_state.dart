import 'package:meta/meta.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:peddi_tont_app/models/sub_category.dart';

@immutable
class AppState {
  static var empty = AppState(new Restaurant(), new Order(),
//      new RestaurantToScreens()
//      new List<Category>()
  );

  final Restaurant restaurant;
  final Order order;
//  final RestaurantToScreens restaurantToScreens;
//  final List<Category> categories;
//  final List<Category> categories;

  AppState(this.restaurant, this.order
//      this.restaurantToScreens
      );
//      this.categories);

//  @override
//  String toString() => "$restaurant";



  AppState.fromJson(Map<String, dynamic> json)
      : restaurant = (json['restaurant']),
        order = (json['order']);
//  restaurantToScreens = (json['restaurantToScreens']);
//        categories = (json['categories'] as List)
//            .map((i) => new Category.fromMap(i as Map<String, dynamic>))
//            .toList();

  Map<String, dynamic> toJson() => {'restaurant': restaurant, 'order': order
//    'restaurantToScreens': restaurantToScreens
  };
}

class RestaurantToScreens {


  RestaurantToScreens({
    this.categories,
    this.subCategories,
    this.products,
    this.ingredients,
  });

  List<Category> categories;
  List<SubCategory> subCategories;
  List<Product> products;
  List<Ingredient> ingredients;

  RestaurantToScreens.fromMap(Map<String, dynamic> data)
      : categories = (data['categories'] == null ? [] : data['categories']  as List).map((i) => new Category.fromMap(i)).toList(),
        subCategories = (data['subCategory'] == null ? [] : data['subCategory']  as List).map((i) => new SubCategory.fromMap(i)).toList(),
        products = (data['products'] == null ? [] : data['products']  as List).map((i) => new Product.fromMap(i)).toList(),
        ingredients = (data['ingredients'] == null ? [] : data['ingredients']  as List).map((i) => new Ingredient.fromMap(i)).toList();


  Map<String, dynamic> toJson() => {
    'categories': categories,
    'subCategories': subCategories,
    'products': products,
    'ingredients': ingredients
  };

}
