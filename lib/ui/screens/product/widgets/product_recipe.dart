import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/product.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/services/external_images.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/util/currency_converter.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      if (_quantityItem > 1) _quantityItem -= 1;
      item.qtyItem = _quantityItem;
    });
  }

  void _sumAmount(Item item) {
    setState(() {
      item.itemPrice = item.itemPrice * _quantityItem;
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
              child: new Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(color: Colors.black, blurRadius: 5.0)
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                width: 470.0,
                height: 730.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        height: 280.0,
                        width: 430.0,
                        child: new CachedNetworkImage(
                            imageUrl: getProductImage(product.image),
                            fit: BoxFit.contain,
                            repeat: ImageRepeat.noRepeat,
                            placeholder: new Center(
                                child: new CircularProgressIndicator()),
                            errorWidget: new Icon(Icons.error)),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 30),
                      child: new Text(item.name,
                          style: FontStyles.productTitleProduct),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 15.0),
                      child: new Text(
                          CurrencyConverter.toBrazilianReal(item.basePrice),
                          style: FontStyles.productsPrice),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 15.0, right: 30.0),
                      child: new Text(
                          product.description == null
                              ? ""
                              : product.description,
                          style: FontStyles.productDescriptionProduct),
                    ),
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: new Divider(color: Colors.black12),
                              ),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Text('Quantidade:',
                                      style:
                                          FontStyles.productDescriptionProduct),
                                  new Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new MaterialButton(
                                          onPressed: () {
                                            _removeQtyItem();
                                          },
                                          textTheme: ButtonTextTheme.accent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: new Icon(
                                            Icons.remove_circle,
                                            color: Colors.black12,
                                            size: 50.0,
                                          ),
                                        ),
                                        new Text(
                                          _quantityItem.toString(),
                                          style: FontStyles.productsQtdProduct,
                                        ),
                                        new MaterialButton(
                                          onPressed: () {
                                            _addQtyItem();
                                          },
                                          textTheme: ButtonTextTheme.accent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: new Icon(
                                            Icons.add_circle,
                                            color: Colors.black12,
                                            size: 50.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: new Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow1,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  width: 470.0,
                                  child: new MaterialButton(
                                    onPressed: () {
                                      _sumAmount(item);
                                      Navigator.pop(context);
                                      callback(item);
                                    },
                                    height: 60.0,
                                    splashColor: Color(0),
                                    textTheme: ButtonTextTheme.accent,
                                    child: new Text('ADICIONAR AO PEDIDO',
                                        style: FontStyles.buttonStyle),
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
