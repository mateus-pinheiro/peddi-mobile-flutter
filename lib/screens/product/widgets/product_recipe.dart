import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class ProductRecipe extends StatefulWidget {
  ProductRecipe(this.product, this.item);

  final Item item;
  final Product product;

  @override
  _ProductRecipeState createState() => _ProductRecipeState(product, item);
}

class _ProductRecipeState extends State<ProductRecipe> {
  _ProductRecipeState(this.product, this.item);

  Item item;
  Product product;
  int _quantityItem;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(color: Colors.black, blurRadius: 5.0)
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  width: 470.0,
                  height: 730.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          height: 280.0,
                          width: 430.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(item.name, style: FontStyles.h6),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child:
                            Text(item.price.toString(), style: FontStyles.h6),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: Text(product.description, style: FontStyles.h6),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                new Divider(color: Colors.black12),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new Text('Quantidade:',
                                          style: FontStyles.a1),
                                      new Row(
                                        children: <Widget>[
                                          new MaterialButton(
                                            onPressed: () {
                                              print(item.amount);
                                            },
                                            height: 60.0,
                                            textTheme: ButtonTextTheme.accent,
                                            child: new Icon(Icons.add_circle),
                                          ),
                                          new Text(_quantityItem.toString()),
                                          new MaterialButton(
                                            onPressed: () {
                                              print(item.amount);
                                            },
                                            height: 60.0,
                                            textTheme: ButtonTextTheme.accent,
                                            child:
                                                new Icon(Icons.remove_circle),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: new Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      width: 470.0,
                                      child: new MaterialButton(
                                        onPressed: () {
                                          print(item.amount);
                                        },
                                        height: 60.0,
                                        textTheme: ButtonTextTheme.accent,
                                        child: new Text('ADICIONAR AO PEDIDO',
                                            style: FontStyles.buttonStyle),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
