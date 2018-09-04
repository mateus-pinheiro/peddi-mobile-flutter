import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class MainFeatured extends StatelessWidget {
  static final _rowHeight = 50.0;
//  static final _borderRadius = BorderRadius.circular(_rowHeight / 2);

//  final Product product;
  final String name;
  final String price;

//  MainFeatured(this.product, this.price, this.name);

//    final featuredImage color = Colors.black;

  const MainFeatured({
    Key key,
    @required this.name,
    @required this.price,
  })  : assert(name != null),
        assert(price != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 30.0),
            child: Container(
              width: 390.0,
              height: 130.0,
              decoration: BoxDecoration(
                color: AppColors.yellow1,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 37.0,
                        right: 29.0,
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CircularStd',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10.0, right: 220.0, bottom: 21.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'RS '+ '$price' +'cada',
                              style: TextStyle(
                                color: Color.fromRGBO(143, 206, 81, 1.0),
                                fontFamily: 'CircularStd',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ]);
  }
}

class MainFeaturedRoute extends StatelessWidget {
  const MainFeaturedRoute();

  static const _featuredNames = <String>[
    'Paletas mexicanas em oferta',
    'Água para acompanhar',
    'Brownie',
    'Paletas mexicanas em oferta',
    'Água para acompanhar',
    'Brownie'
  ];

  static const _featuredPrices = <String>[
    '8,00',
    '2,00',
    '8,00',
    '2,00',
    '8,00',
    '2,00',
  ];

  Widget _buildFeaturedWidgets(List<Widget> featured) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => featured[index],
      itemCount: featured.length,
      scrollDirection: Axis.horizontal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final featured = <MainFeatured>[];

    for (var i = 0; i < _featuredNames.length; i++) {
      featured.add(
          MainFeatured(name: _featuredNames[i], price: _featuredPrices[i]));
    }

    final listView = Container(
//      color: _backgroundColor,
//      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildFeaturedWidgets(featured),
    );

   return listView;
  }
}
