import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/main/widgets/main_featured.dart';
import 'widgets/main_category.dart';
import 'widgets/main_header.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Material(
          color: Colors.black,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(),
            child: Column(
              children: <Widget>[
                MainHeader(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.only(left: 30.0),
//                        child: Text(
//                          'DESTAQUES',
//                          style: FontStyles.h5,
//                        ),
//                      ),
                      Container(
                        height: 160,
                        color: Colors.black,
                        child: MainFeaturedRoute(),
                      ),
                    ],
                  ),
                ),
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
