import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/body/ask_order_body.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/util/completers.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog({this.order});

  final String ticketMessage = "";
  final OnSendOrder order;
  AskOrderBody askOrderBody;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnSendOrder>(
      converter: (store) {
        return (order) => store.dispatch(AskOrderAction(
            order, snackBarCompleter(context, null, null, shouldPop: true)));
      },
      builder: (context, callback) => new Material(
            type: MaterialType.transparency,
            child: new AlertDialog(
              title: new Text('Sua comanda é: ' + ticketMessage,
                  style: FontStyles.confirmationDialogTitle),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text('Envie o pedido e o próximo passo é aguardar :)',
                        style: FontStyles.confirmationDialogText),
                    new Text('Cancele e pediremos para que escaneie novamente.',
                        style: FontStyles.confirmationDialogText),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text(
                    'Cancelar',
                    style: FontStyles.confirmationDialogButton,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new StoreConnector<AppState, Order>(
                  converter: (store) => store.state.order,
                  builder: (context, order) => new FlatButton(
                      child: new Text(
                        'Enviar pedido',
                        style: FontStyles.confirmationDialogButton,
                      ),
                      onPressed: () {
                        askOrderBody = setOrderBody(order);
                        callback(askOrderBody);
//                        Navigator.pop(context);
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => new MenuApp(
//                                  state.restaurant.categories[0],
//                                  state.restaurant.categories)),
//                        );
//                      onSendPressed(state, context);
                      }),
                )
              ],
            ),
          ),
    );
  }
}

AskOrderBody setOrderBody(Order order) {
  var it = new AskOrderBody(
      id: order.id,
      orderPrice: order.amountPrice,
      updatedAt: DateTime.now(),
      consumers: order.consumers);
  return it;
}

//void onSendPressed(AppState state, BuildContext context) {
//  new StoreConnector<AppState, void>(
//      converter: (store) => store.dispatch(AskOrderAction(
//          state.order, qrCodeCompleter(context, null, shouldPop: true))),
//      builder: (context, v) => new MenuApp(
//          state.restaurant.categories[0], state.restaurant.categories));
//}

typedef OnSendOrder = Function(AskOrderBody order);
