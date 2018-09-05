import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';


@immutable
class MainCategory extends StatelessWidget {
  final Category category;
  final List<Category> storeCategories;

  MainCategory(this.category, this.storeCategories);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new MenuApp(category, storeCategories)));
      },
      textTheme: ButtonTextTheme.primary,
      child: Container(
        width: 635.0,
        height: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(getCategoryImage(category.photo)), fit: BoxFit.fitWidth)),
        child: Center(
          child: Text(
            category.name,
            style: FontStyles.style5,
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}

class MainCategoryRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<Category>>(
        converter: (store) => store.state.restaurant.categories,
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
                  childAspectRatio: 3.0),
              scrollDirection: Axis.vertical,
            ),
          );
        });
  }
}
