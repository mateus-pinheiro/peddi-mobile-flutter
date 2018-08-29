import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/screens/main/main_app.dart';
import 'package:peddi_tont_app/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/screens/table_opening/opening.dart';

class Router {



//  static const String table_opening = '/';
  static const String main = '/main';
  static const String menu = '/menu/:category';
  static const String products = '/products';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder> {
//      table_opening: (BuildContext context) => new Opening(),
      main: (BuildContext context) => new MainApp(),
//      menu: (BuildContext context) => new MenuApp(p),
      //menu: (BuildContext context) => new MenuSce(),
    };
  }
}