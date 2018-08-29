import 'package:flutter/material.dart';
import 'widgets/main_category.dart';
import 'widgets/main_featured.dart';
import 'widgets/main_header.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.none,
                    alignment: Alignment(-0.8, -3.0),
                    image: new AssetImage('resources/images/waves_green.png'))),
            child: Column(
              children: <Widget>[
                MainHeader(),
                Container(
//              color: Colors.blue,
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 30.0),
                          child: Text(
                            'DESTAQUES',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'CircularStd',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 175.0,
//                    color: Colors.green,
                        child: MainFeaturedRoute(),
                      )
                    ],
                  ),
                ),
                Container(
//              color: Colors.red,
//              width: MediaQuery.of(context).size.width,
                  height: 410.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'CARDÁPIO',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'CircularStd',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
//                    color: Colors.blue,
                        height: 380.0,
//                    width: MediaQuery.of(context).size.width,
                        child: MainCategoryRoute(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
