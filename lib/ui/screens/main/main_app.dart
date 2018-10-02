import 'package:flutter/material.dart';
import 'widgets/main_category.dart';
import 'widgets/main_header.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Material(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(),
            child: Column(
              children: <Widget>[
                MainHeader(),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: MainCategoryRoute(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
