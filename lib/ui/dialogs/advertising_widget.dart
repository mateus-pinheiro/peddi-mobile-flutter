import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/product/product.dart';
import 'package:peddi_tont_app/util/currency_converter.dart';

class AdvertisingWidget extends StatelessWidget {
  final Product product;

  const AdvertisingWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          child: new CachedNetworkImage(
            placeholder: (context, loading) =>
                new Center(child: new CircularProgressIndicator()),
            imageUrl: getProductImage(product.image),
            fit: BoxFit.cover,
            fadeOutDuration: Duration(milliseconds: 50),
            errorWidget: (context, loading, t) => new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  //                              border: Border.all(
                  //                                  color: AppColors.peddi_white, width: 1.0),
                  image: new DecorationImage(
                    image: new AssetImage('resources/images/fitfood-301.png'),
                    fit: BoxFit.scaleDown,
                  )),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
        new Positioned(
          left: 140,
          top: 210,
          child: new Container(
              constraints: BoxConstraints.expand(width: 280.0, height: 70.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.fitfood,
                      width: 0.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20.0)),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
                color: AppColors.fitfood,
                onPressed: () {
                  showProduct(context, product);
                },
                child: new Text(
                  'EU QUERO',
                  style: FontStyles.advertisingTextButton,
                ),
              )),
        ),
        new Positioned(
            left: 130,
            top: 70,
            child:
                Text(product.name, style: FontStyles.advertisingProductTitle)),
        new Positioned(
            left: 320,
            top: 130,
            child: Text(
              "por " + CurrencyConverter.toBrazilianReal(product.price),
              style: FontStyles.advertisingProductPrice,
            )),
      ],
    );

//    return new Expanded(
//        child: Stack(
//      children: <Widget>[
//        new Image.network("http://via.placeholder.com/350x150",
//            fit: BoxFit.fill),
//        new Text("TESTEEEEE")
//      ],
//    ));
  }
}

showProduct(BuildContext context, Product product) {
  showDialog(context: context, builder: (context) => new ProductRoute(product));
}
