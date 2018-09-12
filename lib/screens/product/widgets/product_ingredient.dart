import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ingredient.forEach((f) => f.isChecked = false);
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
        validateIngredients(ingredient)
      ],
    );
  }

  Widget validateIngredients(List<Ingredient> ingredients) {
    if (ingredients.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: new Container(
            child: Text('Nenhum ingrediente para esse produto.',
                style: FontStyles.style7)),
      );
    }
    return new Expanded(
        child: new Container(child: buildIngredientList(ingredients)));
  }

  Widget ingredientItem(Ingredient ingredient) {
    return new CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: ingredient.isChecked,
      onChanged: (bool newValue) {
        setState(() {
          ingredient.isChecked = newValue;
          if (item.ingredients == null)
            item.ingredients = new List<Ingredient>();

          if (ingredient.isChecked == true) {
            item.ingredients.add(ingredient);
            if (ingredient.price != null)
              item.amount += ingredient.price.toDouble();
          } else
            item.ingredients.remove(ingredient);
        });
      },
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
}
