import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

//@immutable
//class MainCategory extends StatelessWidget {
//  final Category category;
//  final List<Category> storeCategories;
//
//  MainCategory(this.category, this.storeCategories);
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialButton(
//      onPressed: () {
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => new MenuApp(category, storeCategories)));
//      },
//      textTheme: ButtonTextTheme.primary,
//      child: Container(
//        width: 635.0,
//        height: 180.0,
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10.0),
//            color: Colors.black,
//            image: DecorationImage(
//                image: NetworkImage(getCategoryImage(category.photo)),
//                fit: BoxFit.fitWidth)),
//        child: Center(
//          child: Text(
//            category.name,
//            style: FontStyles.style5,
//            textScaleFactor: 1.5,
//          ),
//        ),
//      ),
//    );
//  }
//}

class MainCategoryRoute extends StatefulWidget {
  @override
  MainCategoryRouteState createState() {
    return new MainCategoryRouteState();
  }
}

class MainCategoryRouteState extends State<MainCategoryRoute> {

  bool _loadingInProgress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingInProgress = true;
    _loadingInProgressFalse();


  }

  Future _loadingInProgressFalse() async {
    await new Future.delayed(new Duration(seconds: 3));
    _dataLoaded();
  }

  void _dataLoaded() {
    setState(() {
      _loadingInProgress = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, appState) {
          if (_loadingInProgress) {
            return new Container(
              child: new Center(
                child: new CircularProgressIndicator(),
              ),
            );
          } else {
            return new Container(
              child: new GridView.builder(
                itemCount: appState.restaurant.categories.length,
                itemBuilder: (context, position) => categoryItem(
                    appState.restaurant.categories[position],
                    appState.restaurant.categories),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3.0),
                scrollDirection: Axis.vertical,
              ),
            );
          }
        });
  }

  Widget categoryItem(Category category, List<Category> storeCategories) {
    return new MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new MenuApp(category, storeCategories)));
      },
      textTheme: ButtonTextTheme.primary,
      child: new Container(
        width: 635.0,
        height: 180.0,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black,
            image: new DecorationImage(
                image: new NetworkImage(getCategoryImage(category.photo)),
                fit: BoxFit.fitWidth)),
        child: new Center(
          child: new Text(
            category.name,
            style: FontStyles.style5,
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }



}
