import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/product/product.dart';
import 'package:peddi_tont_app/util/currency_converter.dart';

class MenuProduct extends StatelessWidget {
  final Product product;

  MenuProduct(this.product);

  showProduct(BuildContext context) {
    showDialog(
        context: context, builder: (context) => new ProductRoute(product));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: InkWell(
            onTap: () {
              showProduct(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0,
                    color: Colors.black12,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              constraints: BoxConstraints.expand(
                width: 380.0,
                height: 490.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 380.0,
                      height: 250.0,
//                      child: new CachedNetworkImage(
//                        placeholder:
//                            new Center(child: new CircularProgressIndicator()),
//                        imageUrl: getProductImage(product.image),
//                        fit: BoxFit.contain,
//                        fadeOutDuration: Duration(milliseconds: 50),
//                        errorWidget: new Container(
//                          decoration: new BoxDecoration(
//                              color: Colors.black,
//                              border: Border.all(
//                                  color: AppColors.peddi_white, width: 1.0),
//                              image: new DecorationImage(
//                                image: new AssetImage('resources/images/fitfood-301.png'),
//                                fit: BoxFit.contain,
//                              )),
//                        ),
//                      ),
                    ),
//                      image: new AssetImage('resources/images/product.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 15.0, right: 10.0),
                    child:
                        Text(product.name, style: FontStyles.productNameMenu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                        CurrencyConverter.toBrazilianReal(product.price),
                        style: FontStyles.productPriceMenu),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10.0, right: 16.0),
                        child: Text(
                          product.description == null
                              ? ""
                              : product.description,
                          style: FontStyles.productDescriptionMenu,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuProductRoute extends StatelessWidget {
  final List<Product> products;

  MenuProductRoute(this.products);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new MenuProduct(products[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
//          mainAxisSpacing: 1.0,
//          crossAxisSpacing: 1.0,
//          childAspectRatio: 3.4
      ),
      itemCount: products.length,
      scrollDirection: Axis.vertical,
    );
  }
}
