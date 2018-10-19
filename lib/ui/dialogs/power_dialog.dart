import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/responsible_employee.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/util/qrcode_validator.dart';
import 'package:peddi_tont_app/util/scan.dart';

class PowerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
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

                new StoreConnector<AppState, List<ResponsibleEmployee>>(
                  converter: (store) =>
                  store.state.restaurant.responsibleEmployee,
                  builder: (BuildContext context, waiters) => Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            ScanBarCode()
                                .scan()
                                .then((result) => QrCodeValidator.qrCode(waiters,result, context));
                          },
                          splashColor: Color(0),
                          child: Text(
                            'Reiniciar',
                            style: FontStyles.confirmationDialogButton,
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}
