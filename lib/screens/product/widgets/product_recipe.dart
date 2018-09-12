import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';

class ProductRecipe extends StatelessWidget {
  ProductRecipe(this.item, this.product);

  final Item item;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnAddCallback>(converter: (store) {
      return (item) {
        store.dispatch(AddItemAction(item));
      };
    }, builder: (context, callback) {
      return new ProductRecipeWidget(product, item, callback);
    });
  }
}

class ProductRecipeWidget extends StatefulWidget {
  ProductRecipeWidget(this.product, this.item, this.callback);

  final OnAddCallback callback;
  final Item item;
  final Product product;

  @override
  _ProductRecipeWidgetState createState() =>
      _ProductRecipeWidgetState(product, item, callback);
}

class _ProductRecipeWidgetState extends State<ProductRecipeWidget> {
  _ProductRecipeWidgetState(this.product, this.item, this.callback);

  final OnAddCallback callback;

  Item item;
  Product product;
  int _quantityItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityItem = 1;
    item.qtyItem = _quantityItem;
  }

  void _addQtyItem() {
    setState(() {
      _quantityItem += 1;
      item.qtyItem = _quantityItem;
    });
  }

  void _removeQtyItem() {
    setState(() {
      _quantityItem > 0 ? _quantityItem -= 1 : _quantityItem;
      item.qtyItem = _quantityItem;
    });
  }

  void _sumAmount(Item item) {
    setState(() {
      item.amount = item.amount * _quantityItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Column(
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
                          child: new Image.network(getProductImage(product.image),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(item.name, style: FontStyles.style6),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: Text(item.productPrice(item.price),
                            style: FontStyles.style6),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child:
                            Text(product.description, style: FontStyles.style7),
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new MaterialButton(
                                              onPressed: () {
                                                _removeQtyItem();
                                              },
                                              textTheme: ButtonTextTheme.accent,
                                              child: new Icon(
                                                Icons.remove_circle,
                                                color: Colors.black12,
                                                size: 45.0,
                                              ),
                                            ),
                                            new Text(
                                              _quantityItem.toString(),
                                              style: FontStyles.style10,
                                            ),
                                            new MaterialButton(
                                              onPressed: () {
                                                _addQtyItem();
                                              },
                                              textTheme: ButtonTextTheme.accent,
                                              child: new Icon(
                                                Icons.add_circle,
                                                color: Colors.black12,
                                                size: 45.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: new Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.yellow1,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      width: 470.0,
                                      child: new MaterialButton(
                                        onPressed: () {
                                          _sumAmount(item);
                                          Navigator.pop(context);
                                          callback(item);
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

      ],
    );
  }
}

typedef OnAddCallback = Function(Item item);
