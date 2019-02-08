import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/ingredient.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/util/currency_converter.dart';

class OrderList extends StatefulWidget {
  OrderList(this.order);

  final Order order;

  @override
  OrderListState createState() {
    return new OrderListState(order);
  }
}

class OrderListState extends State<OrderList> {
  final Order order;

  OrderListState(this.order);

  @override
  Widget build(BuildContext context) {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Expanded(
            child: Container(
                child: _buildItemList(
                    order.consumers.isEmpty ? null : order.consumers[0].items)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20.0, bottom: 30.0, right: 50.0),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TOTAL:',
                      style: FontStyles.totalLabelOrder,
                    ),
                    Text(
                      order.amountPrice == null || order.amountPrice < 1
                          ? 'Nenhum item adicionado'
                          : CurrencyConverter.toBrazilianReal(order.amountPrice),
                      style: FontStyles.amountOrder,
                    ),
                  ]),
            ),
          ),
        ]);
  }

  Widget _buildItemList(List<Item> items) {
    return ListView.builder(
      itemBuilder: (context, position) => itemRow(items[position]),
      itemCount: items == null ? 0 : items.length,
      scrollDirection: Axis.vertical,
      cacheExtent: 0.0,
    );
  }

  Widget _buildIngredientList(List<Ingredient> ingredients) {
    if (ingredients != null && ingredients.isNotEmpty) {
      return new Container(
        height: 35.0,
        width: 280.0,
        child: ListView.builder(
          itemBuilder: (context, position) =>
              ingredientRow(ingredients[position]),
          itemCount: ingredients == null ? 0 : ingredients.length,
          scrollDirection: Axis.horizontal,
          cacheExtent: 0.0,
        ),
      );
    } else {
      return new Divider(
        height: 1.0,
        color: Colors.black12,
      );
    }
  }

  Widget itemRow(Item item) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 110.0,
                width: 350.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new StoreConnector<AppState, OnRemoveIconClicked>(
                            converter: (store) {
                          return (item) =>
                              store.dispatch(RemoveItemAction(item));
                        }, builder: (context, callback) {
                          return new IconButton(
                            icon: new Icon(Icons.delete),
                            iconSize: 40.0,
                            onPressed: () {
                              callback(item);
                            },
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: new Container(
                                  width: 250.0,
                                  child: Text(
                                    item.name.toString(),
                                    style: FontStyles.productNameOrder,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              _buildIngredientList(item.ingredients),
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Text(
                                    CurrencyConverter.toBrazilianReal(
                                            item.price) +
                                        ' cada',
                                    style: FontStyles.productPriceOrder),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80.0,
                width: 90.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(item.qtyItem.toString(),
                        style: FontStyles.productsQtdProduct),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 70.0),
          child: Divider(
            height: 2.0,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }

  Widget ingredientRow(Ingredient ingredient) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 1.0),
      child: new Text(
        ingredient.name + ' / ',
        style: FontStyles.ingredientNameProduct,
      ),
    );
  }
}

typedef OnRemoveIconClicked = Function(Item item);
