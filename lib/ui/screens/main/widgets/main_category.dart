import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/menu/menu_app.dart';

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
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 90) / 2;
    final double itemWidth = size.width / 2;

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
            return new GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: appState.restaurant.categories.map((Category category) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MenuApp(
                                category, appState.restaurant.categories)));
                  },
                  child: new Container(
                    margin: new EdgeInsets.all(5.0),
                    decoration: new BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                            color: AppColors.peddi_white, width: 1.0),
                        image: new DecorationImage(
                          image: new NetworkImage(
                              getCategoryImage(category.image)),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: new Center(
                      child: new Text(
                        category.name,
                        style: FontStyles.style5,
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        });
  }
//
//  Widget categoryItem(Category category, List<Category> storeCategories) {
//    return new MaterialButton(
//      onPressed: () {
//        Navigator.push(
//            context,
//            new MaterialPageRoute(
//                builder: (context) => new MenuApp(category, storeCategories)));
//      },
//      textTheme: ButtonTextTheme.primary,
//      child: new Container(
//        decoration: new BoxDecoration(
//            color: Colors.black,
//            image: new DecorationImage(
//                image: new NetworkImage(getCategoryImage(category.image)),
//                fit: BoxFit.fitWidth)),
//        child: new Center(
//          child: new Text(
//            category.name,
//            style: FontStyles.style5,
//            textScaleFactor: 1.5,
//          ),
//        ),
//      ),
//    );
//  }
}
