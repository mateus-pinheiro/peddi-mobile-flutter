import 'package:flutter/material.dart';

import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class Additional extends StatelessWidget {
  Additional(this.additionalList);

  final List<Ingredient> additionalList;

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
              style: FontStyles.h5,
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

  additionalItem(Ingredient additional) {
    var additionalPrice = additional.price;

    return new CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: true,
      onChanged: null,
      title: new Text(
        additional.name,
        style: FontStyles.body,
      ),
      activeColor: Colors.black,
      selected: true,
      secondary: Text(
        'RS $additionalPrice',
        style: FontStyles.body,
      ),
    );
  }
}
