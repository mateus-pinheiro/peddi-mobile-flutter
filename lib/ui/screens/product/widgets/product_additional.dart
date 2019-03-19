import 'package:flutter/material.dart';

import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/util/currency_converter.dart';

class Additional extends StatefulWidget {
  Additional(this.additionalList, this.item);

  final List<Ingredient> additionalList;
  Item item;

  @override
  AdditionalState createState() {
    return new AdditionalState(additionalList, item);
  }
}

class AdditionalState extends State<Additional> {
  AdditionalState(this.additionalList, this.item);

  final List<Ingredient> additionalList;
  Item item;

  @override
  void initState() {
    super.initState();
    additionalList.forEach((f) => f.isChecked = false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0),
            child: new Text(
              'Deixe seu pedido ainda mais completo!',
              style: FontStyles.ingredientTitleProduct,
            ),
          ),
          validateAdditional(additionalList)
        ],
      ),
    );
  }

  Widget validateAdditional(List<Ingredient> ingredients) {
    if (ingredients.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Container(
            child: Text('Nenhum adicional para esse produto.',
                style: FontStyles.style7)),
      );
    }
    return new Expanded(
        child: new Container(child: buildIngredientList(ingredients)));
  }

  additionalItem(Ingredient additional) {
    var additionalPrice = additional.price == null ? null : CurrencyConverter.toBrazilianReal(additional.price);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: new CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: additional.isChecked,
        onChanged: (bool newValue) {
          setState(() {
            additional.isChecked = newValue;
            if (item.ingredients == null)
              item.ingredients = new List<Ingredient>();
            if (additional.isChecked == true) {
              item.ingredients.add(additional);
              if (additional.price != null) item.itemPrice += additional.price;
            } else {
              item.ingredients.remove(additional);
              if (additional.price != null) item.itemPrice -= additional.price;
            }
          });
        },
        title: new Text(
          additional.name,
          style: FontStyles.ingredientNameProduct,
        ),
        activeColor: Colors.green,
        selected: true,
        secondary: Padding(
          padding: const EdgeInsets.only(right: 100.0),
          child: Text(
            additionalPrice == null ? "GRÁTIS" : additionalPrice + " cada",
            style: FontStyles.ingredientPriceProduct,
          ),
        ),
      ),
    );
  }

  Widget buildIngredientList(List<Ingredient> additionalList) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          additionalItem(additionalList[index]),
      scrollDirection: Axis.vertical,
      itemCount: additionalList.length,
    );
  }
}
