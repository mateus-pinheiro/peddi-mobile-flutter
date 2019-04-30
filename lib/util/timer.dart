import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:peddi_tont_app/ui/screens/menu/widgets/menu_category.dart';

class TimerApp {

  static  goToAdvertising(BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuCategoryRoute(fromInactivityTimer: true))
      );
//    _timer.cancel();
  }

}