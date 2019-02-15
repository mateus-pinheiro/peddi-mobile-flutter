import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/util/completers.dart';

class PowerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnFinishOrder>(
      converter: (store) {
        return (order) => store.dispatch(EndOrderAction(
            order,
            snackBarCompleterToOpening(
                context,
                "O pedido foi finalizado com sucesso.",
                "Não conseguimos realizar a finalização do pedido. Tente novamente.",
                shouldPop: true)));
      },
      builder: (context, callback) => new Material(
            type: MaterialType.transparency,
            child: new Stack(
              children: <Widget>[
                new InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                new AlertDialog(
                    title: new Text('Realmente deseja reiniciar o app?',
                        style: FontStyles.confirmationDialogTitle),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          new Text('Caso reinice, seu carrinho será esvaziado.',
                              style: FontStyles.confirmationDialogText),
                          new Text('Cancele e continue fazendo o seu pedido',
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
                      new StoreConnector <AppState, Order>(
                        converter: (store) => store.state.order,
                        builder: (context, order) => new FlatButton(
                          child: new Text(
                            'Reiniciar',
                            style: FontStyles.confirmationDialogButton,
                          ),
                          onPressed: () {
                            callback(order.id);
                          },
                        ),
                      ),

//                      onSendPressed(state, context);
                    ])
              ],
            ),

//          new Center(
//            child: Container(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                    width: 500.0,
//                    height: 200.0,
//                    decoration: BoxDecoration(
//                        boxShadow: [
//                          new BoxShadow(
//                            color: Colors.black,
//                            blurRadius: 10.0,
//                          )
//                        ],
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.white),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//                      children: <Widget>[
//                        Text('Você realmente deseja reiniciar o app?',style: FontStyles.confirmationDialogTitle,),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            MaterialButton (
//                              onPressed: () {
//                                Navigator.pushNamed(context, '/opening');
//
//                              },
//                              color: Colors.green,
//                              height: 30.0,
//                              minWidth: 30.0,
//                              child: Text('SIM',style: FontStyles.style4,),
//                            ),
//                            MaterialButton (
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                              color: Colors.red,
//                              height: 30.0,
//                              minWidth: 30.0,
//                              child: Text('NÃO',style: FontStyles.style4,),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
          ),
    );
  }
}

typedef OnFinishOrder = Function(String orderId);
