import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class Additional extends StatelessWidget {
  final String ingredientName = '+1 Hamburguer 180g de costela';
  final String ingredientPrice = '2,00';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: new Text(
              'Deixe seu pedido ainda mais completo!',
              style: FontStyles.h5,
            ),
          ),
        Padding(

          padding: const EdgeInsets.only(right: 40.0),
            child: new CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              onChanged: null,
              title: new Text(
                ingredientName,
                style: FontStyles.body,
              ),
              activeColor: Colors.black,
              selected: true,
              secondary: Text(
                'RS $ingredientPrice',
                style: FontStyles.body,
              ),
            ),
        )
        ],
      ),
    );
  }
}
