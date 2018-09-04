import 'package:flutter/material.dart';

import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

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
  bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = false;
  }

  additionalItem(Ingredient additional) {
    var additionalPrice = additional.price;

    return new CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: isSelected,
      onChanged: (bool newValue) {
        setState(() {
          isSelected = newValue;
          if (item.ingredients == null)
            item.ingredients = new List<Ingredient>();
          item.ingredients.add(additional);

          if (isSelected == true) {
            if (additional.price != null)
              item.amount += additional.price.toDouble();
          } else {
            if (additional.price != null)
              item.amount -= additional.price.toDouble();
          }
        });
      },
      title: new Text(
        additional.name,
        style: FontStyles.style7,
      ),
      activeColor: Colors.green,
      selected: true,
      secondary: Text(
        'RS $additionalPrice',
        style: FontStyles.style7,
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
              style: FontStyles.style9,
            ),
          ),
          new Expanded(
              child: new Container(
            child: buildIngredientList(additionalList),
          ))
        ],
      ),
    );
  }
}
