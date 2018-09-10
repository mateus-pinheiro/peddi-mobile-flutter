import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/screens/product/widgets/product_additional.dart';
import 'package:peddi_tont_app/screens/product/widgets/product_ingredient.dart';
import 'package:peddi_tont_app/screens/product/widgets/product_recipe.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/models/order.dart';
class ProductRoute extends StatelessWidget {
  ProductRoute(this.product);

  Product product;
  final Item item = new Item();

  List<Ingredient> additionalList = new List<Ingredient>();
  List<Ingredient> ingredientList = new List<Ingredient>();
  List<Ingredient> optionList = new List<Ingredient>();

  void setItem() {
    this.item.name = this.product.name;
    this.item.price = this.product.price.toDouble();
    this.item.amount = this.product.price.toDouble();
//    item.idEpoc = product.idEpoc;
  }

  setIngredientList(List<Ingredient> ingredients) {
    ingredients.forEach(validateIngredient);
  }

  void validateIngredient(Ingredient element) {

    if (element != null) {
      if (element.type == 'DEFAULT')
        ingredientList.add(element);
      else if (element.type == 'ADDITIONAL')
        additionalList.add(element);
      else
        optionList.add(element);
    }
  }

  //Condicional para verificar abertura de tela de produto/ingredients;
  Widget showProduct(Product product) {
    setItem();
    setIngredientList(product.ingredients);

    if (product.ingredients.isNotEmpty) {
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
                        child: new IngredientWidget(ingredientList, item)),
                    new Divider(
                      color: Colors.black12,
                    ),
                    new Expanded(child: new Additional(additionalList, item)),
                  ],
                ),
              ),
            ),
            new Positioned(
//          decoration: new BoxDecoration(gradient: backgroundGradient),
                child: new ProductRecipe(item, product),
                left: 290.0,
                bottom: 1.0),
            new Positioned(
              right: 100.0,
              child: new Stack(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                         new Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 35.0,
                          ),
                      ],
                    ),
                  ),
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
                child: new ProductRecipe(item, product),
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
