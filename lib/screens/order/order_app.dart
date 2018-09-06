import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/screens/order/widgets/order_list.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';

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
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      height: 80.0,
                      width: 545.0,
                      child: Center(child: Text('Itens do pedido',style: FontStyles.style10,)),
                    ),
                    Container(
                      color: Colors.green,
                      height: 50.0,
                      width: 545.0,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            width: 545.0,
                            height: 50.0,
                            color: AppColors.yellow1,
                            child: Center(
                                child: Text(
                              'PRODUTO',
                              style: FontStyles.style11,
                            )),
                          )),
                          Expanded(
                              child: Container(
                            width: 545.0,
                            height: 50.0,
                            color: AppColors.yellow1,
                            child: Center(
                                child: Text(
                              'QUANTIDADE',
                              style: FontStyles.style11,
                            )),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      height: 400.0,
                      width: 545.0,
                          child: new OrderList(order),
                    )),
                    Container(
                      height: 69.0,
                      width: 545.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.yellow1,
                      ),
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
