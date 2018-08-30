import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class IngredientWidget extends StatefulWidget {
  IngredientWidget(this.ingredient);

  final List<Ingredient> ingredient;

  @override
  IngredientWidgetState createState() {
    return new IngredientWidgetState(ingredient);
  }
}

class IngredientWidgetState extends State<IngredientWidget> {
  IngredientWidgetState(this.ingredient);

  final List<Ingredient> ingredient;

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0),
          child: new Text(
            'Ingrediente',
            style: FontStyles.h5,
          ),
        ),
        Expanded(child: new Container(child: buildIngredientList(ingredient)))
      ],
    );
  }

  Widget ingredientItem(Ingredient ingredient) {
    return new CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: true,
      onChanged: null,
      title: new Text(
        ingredient.name,
        style: FontStyles.body,
      ),
      activeColor: Colors.black,
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
