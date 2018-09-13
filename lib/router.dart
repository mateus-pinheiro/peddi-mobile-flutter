import 'package:flutter/material.dart';

import 'package:peddi_tont_app/ui/screens/main/main_app.dart';
import 'package:peddi_tont_app/ui/screens/order/order_app.dart';

class Router {
//  static const String table_opening = '/';
  static const String main = '/main';
  static const String menu = '/menu/:category';
  static const String products = '/products';
  static const String order = '/order';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
//      table_opening: (BuildContext context) => new Opening(),
      main: (BuildContext context) => new MainApp(),
      order: (BuildContext context) => new OrderApp(),
//      menu: (BuildContext context) => new MenuApp(p),
      //menu: (BuildContext context) => new MenuSce(),
    };
  }
}
