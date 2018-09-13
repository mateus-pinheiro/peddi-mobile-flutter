import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/util/money_converter.dart';

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
            child: Container(child: _buildItemList(order.items)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 30.0, right: 50.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  'TOTAL:',
                  style: FontStyles.totalLabelCart,
                ),
                Text(
                  order.amount == null || order.amount == 0.0
                      ? 'Nenhum item adicionado'
                      : CurrencyConverter.toBrazilianReal(order.amount),
                  style: FontStyles.amountCart,
                ),
              ]),
            ),
          ),
        ]);
  }

  Widget _buildItemList(List<Item> items) {
    return ListView.builder(
      itemBuilder: (context, position) => itemRow(items[position]),
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      cacheExtent: 0.0,
    );
  }

  Widget itemRow(Item item) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                height: 80.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new StoreConnector<AppState,
                                    OnRemoveIconClicked>(converter: (store) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(item.name.toString(),
                                            style: FontStyles.productNameCart),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                            CurrencyConverter.toBrazilianReal(
                                                    item.price) +
                                                ' cada',
                                            style: FontStyles.productPriceCart),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                height: 80.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(item.qtyItem.toString(),
                        style: FontStyles.productsQtdProduct),
                  ],
                ),
              ),
            )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 70.0),
          child: Divider(
            height: 02.0,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}

typedef OnRemoveIconClicked = Function(Item item);
