import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/screens/product/product.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class MenuProduct extends StatelessWidget {

  final Product product;
  MenuProduct(this.product);

  showProduct(BuildContext context) {
    showDialog( context: context,
        builder: (context) => new ProductRoute(product));
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
                    width: 2.0, color: Colors.black12, style: BorderStyle.solid),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
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
                    child: Image(
                      image: new AssetImage('resources/images/product.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 15.0),
                    child: Text(product.name, style: FontStyles.h4),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 15.0),
                    child: Text(product.price.toString(), style: FontStyles.h5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                    child: Text(product.description, style: FontStyles.body),
                  )
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
  MenuProductRoute (this.products);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (BuildContext context, int index) => new MenuProduct(products[index]),
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
