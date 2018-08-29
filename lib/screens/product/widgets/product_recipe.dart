import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class ProductRecipe extends StatefulWidget {
  ProductRecipe(this.product);

  final Product product;

  @override
  _ProductRecipeState createState() => _ProductRecipeState(product);
}

class _ProductRecipeState extends State<ProductRecipe> {
  _ProductRecipeState(this.product);

  Product product;

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
                        child: Text(product.name, style: FontStyles.h6),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: Text(product.price.toString(),
                            style: FontStyles.h6),
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
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        color: Colors.black12,
                                        height: 2.0,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Quantidade:',
                                              style: FontStyles.a1),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Valor total:',
                                              style: FontStyles.a1),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text('RS 50,00',
                                                style: FontStyles.a1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      width: 470.0,
                                      child: MaterialButton(
                                        onPressed: () {},
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
