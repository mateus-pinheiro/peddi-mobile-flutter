import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/screens/product/widgets/product_additional.dart';
import 'package:peddi_tont_app/screens/product/widgets/product_ingredient.dart';
import 'package:peddi_tont_app/screens/product/widgets/product_recipe.dart';

class ProductRoute extends StatelessWidget {
  ProductRoute(this.product);

  final Product product;

  //Condicional para verificar abertura de tela de produto/ingredients;
  Widget showProduct(Product product) {
    if (product.ingredient.isNotEmpty) {
      return new Material(
        type: MaterialType.transparency,
        child: new Stack(
          children: <Widget>[
            new Positioned(
              left: 80.0,
              top: 40.0,

                child: new Container(
                  width: 620.0,
                  height: 670.0,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: new IngredientWidget(product.ingredient)),
//                  new Container(
//                    child:
////                    color: Colors.red,
//                    height: 200.0,
////                        child:
//                  ),
                      new Divider(
                        color: Colors.black12,
                      ),
                      new Container(
                        height: 200.0,
                        child: Additional(),
                      ),
                    ],
                  ),
                ),

            ),
            new Positioned(
//          decoration: new BoxDecoration(gradient: backgroundGradient),
                child: new ProductRecipe(product),
                left: 290.0,
                bottom: 1.0),
            new Positioned(
              top: 5.0,
              right: 110.0,
              child: new Stack(
                children: <Widget>[
                  Container(width: 30.0, height: 30.0, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return new Material(
        type: MaterialType.transparency,
        child: new Stack(
          children: <Widget>[
            new Positioned(
//              decoration: new BoxDecoration(gradient: backgroundGradient),
                child: new ProductRecipe(product),
//          left: 240.0,
                bottom: 3.0),
            new Positioned(
              top: 5.0,
              right: 395.0,
              child: new Stack(
                children: <Widget>[
                  Container(width: 30.0, height: 30.0, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return showProduct(product);
  }
}
