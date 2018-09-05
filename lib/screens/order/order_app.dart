import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/screens/order/widgets/order_list.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class OrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, Order>(converter: (store) {
      return store.state.order;
    }, builder: (context, order) {
      return new Material(
        type: MaterialType.transparency,
        child: new Stack(
          children: <Widget>[
            new Center(
              child: new Container(
                height: 693.0,
                width: 545.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            'Itens do pedido',
                            style: FontStyles.orderStatus1,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: new OrderList(order)),
                    Container(
                      height: 59.0,
                      width: 545.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.green),
                      child: MaterialButton(
                        onPressed: () {},
                        height: 60.0,
                        textTheme: ButtonTextTheme.accent,
                        child: new Text('ENVIAR PEDIDO',
                            style: FontStyles.buttonStyle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
