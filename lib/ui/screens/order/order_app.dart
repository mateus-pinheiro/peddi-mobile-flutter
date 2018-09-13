import 'package:peddi_tont_app/ui/screens/order/widgets/order_list.dart';
import 'package:peddi_tont_app/util/completers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';

class OrderApp extends StatelessWidget {
  OnSendPressed callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: Colors.transparent,
      child: new StoreConnector<AppState, Order>(converter: (store) {
        return store.state.order;
      }, builder: (context, order) {
        return new Stack(
          children: <Widget>[
            new Center(
              child: new Container(
                height: 693.0,
                width: 560.0,
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
                      height: 80.0,
                      width: 560.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                        child: Text(
                          'Itens do pedido',
                          style: FontStyles.ingredientTitleProduct,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 560.0,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            height: 50.0,
                            color: AppColors.yellow1,
                            child: Center(
                                child: Text(
                              'Produto',
                              style: FontStyles.titlesCart,
                            )),
                          )),
                          Expanded(
                              child: Container(
                            height: 50.0,
                            color: AppColors.yellow1,
                            child: Center(
                                child: Text(
                              'Quantidade',
                              style: FontStyles.titlesCart,
                            )),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: new OrderList(order),
                    ),
                    new StoreConnector<AppState, OnSendPressed>(
                      converter: (store) {
                        return (order) => store.dispatch(SendOrder(
                            order,
                            snackBarCompleter(context, 'Dialog',
                                shouldPop: true)));
                      },
                      builder: (BuildContext context, callback) => Container(
                            height: 69.0,
                            width: 560.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.yellow1,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                callback(order);
                              },
                              splashColor: Color(0),
                              height: 60.0,
                              textTheme: ButtonTextTheme.accent,
                              child: new Text('ENVIAR PEDIDO',
                                  style: FontStyles.buttonStyle),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

typedef OnSendPressed = Function(Order order);
