import 'package:flutter/material.dart';
import 'package:peddi_tont_app/ui/dialogs/loading_dialog.dart';

import 'package:peddi_tont_app/ui/screens/main/main_app.dart';
import 'package:peddi_tont_app/ui/screens/order/order_app.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/opening.dart';

class Router {
//  static const String table_opening = '/';
  static const String main = '/main';
  static const String menu = '/menu/:category';
  static const String products = '/products';
  static const String order = '/order';
  static const String opening = '/opening';
  static const String loading = '/loading';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
//      table_opening: (BuildContext context) => new Opening(),
      main: (BuildContext context) => new MainApp(),
      order: (BuildContext context) => new OrderApp(),
      opening: (BuildContext context) => new Opening(),
    loading: (BuildContext context) => LoadingDialog(),
//      menu: (BuildContext context) => new MenuApp(p),
      //menu: (BuildContext context) => new MenuSce(),
    };
  }
}
