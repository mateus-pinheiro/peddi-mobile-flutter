import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:flutter_redux/flutter_redux.dart';

class IngredientWidget extends StatefulWidget {
  IngredientWidget(this.ingredient, this.item);

  final List<Ingredient> ingredient;
  final Item item;

  @override
  IngredientWidgetState createState() {
    return new IngredientWidgetState(ingredient, item);
  }
}

class IngredientWidgetState extends State<IngredientWidget> {
  IngredientWidgetState(this.ingredient, this.item);

  Item item;
  List<Ingredient> ingredient;
  bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0),
          child: new Text(
            'Ingredientes',
            style: FontStyles.style9,
          ),
        ),
        Expanded(child: new Container(child: buildIngredientList(ingredient)))
      ],
    );
  }

  Widget ingredientItem(Ingredient ingredient) {
    return new CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: isSelected,
            onChanged: (bool newValue) {
              setState(() {
                isSelected = newValue;
                if (item.ingredients == null)
                  item.ingredients = new List<Ingredient>();
                item.ingredients.add(ingredient);
                if (ingredient.price != null)
                  item.amount += ingredient.price.toDouble();
              });
            },
//        onChanged: _selectIngredient,
            title: new Text(
              ingredient.name,
              style: FontStyles.style7,
            ),
            activeColor: Colors.green,
            selected: true,
          );
  }

  Widget buildIngredientList(List<Ingredient> ingredientList) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          ingredientItem(ingredientList[index]),
      scrollDirection: Axis.vertical,
      itemCount: ingredientList.length,
    );
  }

//  void _selectIngredient(bool select) {
//    setState(() {
//      isSelected = select;
//    });
//  }
}

typedef OnIngredientStateChanged = Function(Item item);
