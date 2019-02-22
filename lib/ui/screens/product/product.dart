import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/ui/screens/product/widgets/product_additional.dart';
import 'package:peddi_tont_app/ui/screens/product/widgets/product_ingredient.dart';
import 'package:peddi_tont_app/ui/screens/product/widgets/product_recipe.dart';

class ProductRoute extends StatelessWidget {
  ProductRoute(this.product);

  Product product;
  final Item item = new Item();
  static const FREE_INGREDIENT = 0;
  static const PAID_INGREDIENT = 1;
  static const PIECE_INGREDIENT = 2;

  List<Ingredient> additionalList = new List<Ingredient>();
  List<Ingredient> ingredientList = new List<Ingredient>();
  List<Ingredient> optionList = new List<Ingredient>();

  void setItem() {
    this.item.name = this.product.name;
    this.item.basePrice = this.product.price.toDouble();
    this.item.itemPrice = this.product.price.toDouble();
    this.item.mgmtId = this.product.mgmtId;
    this.item.baseCloudId = this.product.productCloudId;
  }

  setIngredientList(List<Ingredient> ingredients) {
    ingredients.forEach(validateIngredient);
  }

  void validateIngredient(Ingredient element) {
    if (element != null) {
      if (element.type == FREE_INGREDIENT)
        ingredientList.add(element);
      else if (element.type == PAID_INGREDIENT)
        additionalList.add(element);
      else
        optionList.add(element);
    }
  }

  //Condicional para verificar abertura de tela de produto/ingredients;
  Widget showProduct(Product product, BuildContext context) {
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
                right: 120.0,
                bottom: 28.0),
            new Positioned(
              right: 100.0,
              child: new Stack(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: AppColors.botonblue,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: new IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: new Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 35.0,
                      ),
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
            new InkWell(
              onTap: () => Navigator.of(context).pop(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            new Positioned(
//              decoration: new BoxDecoration(gradient: backgroundGradient),
                child: new ProductRecipe(item, product),
                left: 405.0,
                bottom: 20.0),
            new Positioned(
              top: 5.0,
              right: 385.0,
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: AppColors.botonblue,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: new IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: new Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                  ),
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
    return showProduct(product, context);
  }
}
