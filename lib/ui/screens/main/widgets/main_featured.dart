//import 'package:flutter/material.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:peddi_tont_app/models/app_state.dart';
//import 'package:peddi_tont_app/models/featured_list.dart';
//import 'package:peddi_tont_app/models/product.dart';
//import 'package:peddi_tont_app/services/external_images.dart';
//import 'package:peddi_tont_app/themes/app_colors.dart';
//import 'package:peddi_tont_app/ui/screens/product/product.dart';
//import 'package:peddi_tont_app/util/currency_converter.dart';
//
//class MainFeatured extends StatelessWidget {
//  final Product product;
//
//  const MainFeatured({Key key, this.product}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
//        Widget>[
//      new Padding(
//        padding: const EdgeInsets.only(top: 10.0, left: 30.0),
//        child: new Container(
//          width: 390.0,
//          height: 130.0,
//          decoration: new BoxDecoration(
//              color: Colors.black,
//              borderRadius: BorderRadius.circular(8),
//              border: new Border.all(color: AppColors.peddi_white, width: 1.0),
//              image: new DecorationImage(
//                image: new NetworkImage(getCategoryImage(product.image)),
//                fit: BoxFit.cover,
//              )),
//          child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                new Padding(
//                  padding: const EdgeInsets.only(
//                    left: 20.0,
//                    top: 37.0,
//                    right: 29.0,
//                  ),
//                  child: new InkWell(
//                    onTap: () {
//                      Navigator.push(
//                          context,
//                          new MaterialPageRoute(
//                              builder: (context) => Container(
//                                    height: 100,
//                                    width: 350,
//                                    child: new ProductRoute(product),
//                                  )));
//                    },
//                    child: new Text(
//                      product.name,
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: 'CircularStd',
//                        fontSize: 24.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                ),
//                new Expanded(
//                  child: new Padding(
//                    padding: const EdgeInsets.only(
//                        left: 20.0, top: 10.0, right: 220.0, bottom: 21.0),
//                    child: Container(
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(8.0),
//                      ),
//                      child: Center(
//                        child: Text(
//                          CurrencyConverter.toBrazilianReal(product.price),
//                          style: TextStyle(
//                            color: Color.fromRGBO(143, 206, 81, 1.0),
//                            fontFamily: 'CircularStd',
//                            fontSize: 18.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ]),
//        ),
//      )
//    ]);
//  }
//}
//
//class MainFeaturedRoute extends StatefulWidget {
//  const MainFeaturedRoute();
//
////  static const _featuredNames = <String>[
////    'Paletas mexicanas em oferta',
////    'Água para acompanhar',
////    'Brownie',
////    'Paletas mexicanas em oferta',
////    'Água para acompanhar',
////    'Brownie'
////  ];
////
////  static const _featuredPrices = <String>[
////    '8,00',
////    '2,00',
////    '8,00',
////    '2,00',
////    '8,00',
////    '2,00',
////  ];
////
////  static const _featuredImg = <String>[
////    '8,00',
////    '2,00',
////    '8,00',
////    '2,00',
////    '8,00',
////    '2,00',
////  ];
//
//  @override
//  _MainFeaturedRouteState createState() => _MainFeaturedRouteState();
//}
//
//class _MainFeaturedRouteState extends State<MainFeaturedRoute> {
//  Widget _buildFeaturedWidgets(List<Widget> featured) {
//    return ListView.builder(
//      itemBuilder: (BuildContext context, int index) => featured[index],
//      itemCount: featured.length,
//      scrollDirection: Axis.horizontal,
//    );
//  }
//
//  Widget _buildListOfWidgets(FeaturedList featuredList) {
//    final featured = <MainFeatured>[];
//
//    for (var i = 0; i < featuredList.products.length; i++) {
//      featured.add(MainFeatured(product: featuredList.products[i]));
//    }
//
//    final listView = Container(
////      color: _backgroundColor,
////      padding: EdgeInsets.symmetric(horizontal: 8.0),
//      child: _buildFeaturedWidgets(featured),
//    );
//
//    return listView;
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    final featured = <MainFeatured>[];
////
////    for (var i = 0; i < MainFeaturedRoute._featuredNames.length; i++) {
////      featured.add(MainFeatured(
////          name: MainFeaturedRoute._featuredNames[i],
////          price: MainFeaturedRoute._featuredPrices[i]));
////    }
////
////    final listView = Container(
//////      color: _backgroundColor,
//////      padding: EdgeInsets.symmetric(horizontal: 8.0),
////      child: _buildFeaturedWidgets(featured),
////    );
////
////    return listView;
//
//    return new StoreConnector<AppState, AppState>(
//        converter: (store) => store.state,
//        builder: (context, appState) {
//          return new Stack(
//            alignment: Alignment.topRight,
//            children: <Widget>[
//              _buildListOfWidgets(appState.featuredList),
//            ],
//          );
//        });
//  }
//}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/ui/screens/product/product.dart';
import 'package:peddi_tont_app/util/currency_converter.dart';

const int TIME_SCROLL = 2000;

class MainFeaturedRoute extends StatefulWidget {
  @override
  _MainFeaturedRouteState createState() => _MainFeaturedRouteState();
}

class _MainFeaturedRouteState extends State<MainFeaturedRoute> {
  bool _loadingInProgress;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _loadingInProgressFalse();
    _scrollController = new ScrollController();
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
    Timer(
        Duration(milliseconds: TIME_SCROLL),
        () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.linear,
            duration: Duration(seconds: 45)));

    return new StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, appState) {
          if (appState.featuredList.products == null ||
              appState.featuredList.products.length < 1) {
            return Container(
              width: MediaQuery.of(context).size.width / 1.1,
              color: Colors.black,
              child: Text(
                'Não temos nenhum destaque no momento. Escolha uma categoria abaixo.',
                style: FontStyles.advertisingProductPrice,
              ),
            );
          } else {
            return _buildCategoryGrid(appState);
          }
        });
  }

  showProduct(BuildContext context, Product product) {
    showDialog(
        context: context, builder: (context) => new ProductRoute(product));
  }

  Widget _buildCategoryGrid(AppState appState) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 90) / 2;
    final double itemWidth = size.width / 2;

    return new ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: appState.featuredList.products.length,
      itemBuilder: (context, position) =>
          productItem(appState.featuredList.products[position]),
    );
  }

//
  Widget productItem(Product product) {
    return new InkWell(
        onTap: () {
          showProduct(context, product);
        },
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 30.0, bottom: 5),
                child: new Container(
                  width: 390.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                      border: new Border.all(
                          color: AppColors.peddi_white, width: 1.0),
                      image: new DecorationImage(
                        image:
                            new NetworkImage(getCategoryImage(product.image)),
                        fit: BoxFit.cover,
                      )),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 37.0,
                            right: 29.0,
                          ),
                          child: new Text(
                            product.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CircularStd',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                const BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 10.0,
                                right: 220.0,
                                bottom: 21.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                    CurrencyConverter.toBrazilianReal(
                                            product.price) +
                                        " cada",
                                    style: FontStyles.featuredProductPrice),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            ]));
  }
}
