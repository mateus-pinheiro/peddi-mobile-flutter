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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total',
                style: FontStyles.orderStatus2,
              ),
              Text(
                order.amount != null
                    ? order.amount.toString()
                    : 'Nenhum item adicionado',
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
    );
  }

  Widget itemRow(Item item) {
    return new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              new StoreConnector<AppState, OnRemoveIconClicked>(
                  converter: (store) {
                return (item) => store.dispatch(RemoveItemAction(item));
              }, builder: (context, callback) {
                return new IconButton(
                  icon: new Icon(Icons.delete),
                  onPressed: () {
                    callback(item);
                  },
                );
              }),
              new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Text(item.name, style: FontStyles.orderStatus3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Text(item.price.toString(),
                        style: FontStyles.orderStatus3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Text(item.qtyItem.toString(),
                        style: FontStyles.orderStatus3),
                  ),
                ],
              ),
            ],
          ),
        ),
        new Divider(
          height: 20.0,
          color: Colors.black12,
        ),
      ],
    );
  }
}

typedef OnRemoveIconClicked = Function(Item item);
