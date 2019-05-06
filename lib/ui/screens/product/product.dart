import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/ui/screens/product/widgets/product_additional.dart';
import 'package:peddi_tont_app/ui/screens/product/widgets/product_ingredient.dart';
import 'package:peddi_tont_app/ui/screens/product/widgets/product_recipe.dart';

class ProductRoute extends StatefulWidget {
  ProductRoute(this.product);

  final Product product;
  static const FREE_INGREDIENT = 0;
  static const PAID_INGREDIENT = 1;
  static const PIECE_INGREDIENT = 2;

  @override
  _ProductRouteState createState() => _ProductRouteState();
}

class _ProductRouteState extends State<ProductRoute>
    with SingleTickerProviderStateMixin {
  final Item item = new Item();

  List<Ingredient> additionalList = new List<Ingredient>();

  List<Ingredient> ingredientList = new List<Ingredient>();

  List<Ingredient> optionList = new List<Ingredient>();

  AnimationController animationController;

  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void setItem() {
    this.item.name = this.widget.product.name;
    this.item.basePrice = this.widget.product.price.toDouble();
    this.item.itemPrice = this.widget.product.price.toDouble();
    this.item.maxChoices = this.widget.product.sidesLimit;
    this.item.mgmtId = this.widget.product.mgmtId;
    this.item.baseCloudId = this.widget.product.productCloudId;
  }

  setIngredientList(List<Ingredient> ingredients) {
    ingredients.forEach(validateIngredient);
  }

  void validateIngredient(Ingredient element) {
    if (element != null) {
      if (element.type == ProductRoute.PIECE_INGREDIENT)
        ingredientList.add(element);
      else
        additionalList.add(element);
//      else
//        optionList.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    return showProduct(widget.product, context);
//    final double width = MediaQuery.of(context).size.width;
//
//    return new AnimatedBuilder(
//      builder: (BuildContext context, Widget child) {
//        return Transform(
//          transform:
//              Matrix4.translationValues(animation.value * width, 0.0, 0.0),
//          child: showProduct(widget.product, context),
//        );
//      },
//      animation: animationController,
//    );
  }

  Widget showProduct(Product product, BuildContext context) {
    setItem();
    setIngredientList(product.ingredients);

    if (product.ingredients.isNotEmpty) {
      return withAddOnsProduct(context);
    } else {
      return noAddOnsProduct(context);
    }
  }


  Widget noAddOnsProduct(BuildContext context) {
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
              child: new ProductRecipe(item, widget.product),
              left: 405.0,
              bottom: 5.0),
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

  Widget withAddOnsProduct(BuildContext context) {
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
              child: new ProductRecipe(item, widget.product),
              right: 120.0,
              bottom: 20.0),
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
  }
}
