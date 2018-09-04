import 'dart:async';
import 'dart:convert';

import 'package:peddi_tont_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/screens/menu/widgets/menu_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class MainCategory extends StatelessWidget {
  final Category category;
  List<Category> storeCategories;
  MainCategory(this.category, this.storeCategories);

  @override
  Widget build(BuildContext context) {
    return
//      Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new MenuApp(category, storeCategories)));
//                pushNamed(context, '/main');
          },

          textTheme: ButtonTextTheme.primary,
          child:
          Container(
            width: 635.0,
            height: 180.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.black,),
            child: Center(
              child: Text(
                category.name,
                style: FontStyles.style5,
              ),
            ),
          ),
        );


  }
}

class MainCategoryRoute extends StatelessWidget {
//  const MainCategoryRoute();

//  loadCategoriesFromPrefs()  async {
//    SharedPreferences preferences =  await SharedPreferences.getInstance();
//    var categoriesString = preferences.getString('CATEGORY_APP');
//    List<Category> categories = (categoriesString as List).map((i) => new Category.fromMap(i)).toList();
//    listCategories = categories;
//  }

//  Future<List<Category>> list = loadCategoriesFromPrefs().then((categories) {listCategories = categories;});

//  List<Category> teste(AppState store){
//    print(store.order.table);
//    print(store.order.customers);
//    print(store.order.createdAt);
//    return store.restaurant.categories;
//  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<Category>>(
        converter: (store) => store.state.restaurant.categories,
//    converter: (store) => teste(store.state),
        builder: (context, list) {
          return new Container(
            child: new GridView.builder(
              itemCount: list.length,
              itemBuilder: (context, position) =>
                  new MainCategory(list[position], list),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
//                  mainAxisSpacing: 1.0,
//                  crossAxisSpacing: 6.0,
                  childAspectRatio:3.5),
              scrollDirection: Axis.vertical,
            ),
          );
//        return new ListView.builder(
//            itemCount: list.length,
//            itemBuilder: (context, position) =>
//            new ShoppingListItem(list[position]));
//      },
        });

  }

}
