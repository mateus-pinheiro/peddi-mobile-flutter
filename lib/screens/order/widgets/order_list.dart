import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';

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
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Expanded(
        child: Container(child: _buildItemList(order.items)),
      ),
      Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total',
                style: FontStyles.orderStatus2,
              ),
              Text(
                order.amount == null || order.amount == 0.0
                    ? 'Nenhum item adicionado'
                    : order.amount.toString(),
                style: FontStyles.orderStatus2,
              ),
            ]),
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
                                        Column(
                                          children: <Widget>[
                                            Text(item.name, style: FontStyles.style7),
                                            Text(item.price.toString(), style: FontStyles.style7),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.white,
                        height: 80.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(item.qtyItem.toString(),
                                style: FontStyles.style7),
                          ],
                        ),
                      )),
                ],
              ),


      ],
    );

  }
}

typedef OnRemoveIconClicked = Function(Item item);
