import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/widgets/opening_scan.dart';
import 'package:peddi_tont_app/util/scan.dart';

class OpeningFormRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnAddTableNumber>(converter: (store) {
      return (tableNumber, qtyConsumer) {
        store.dispatch(new LoadRestaurantAction());
        store.dispatch(new AddTableNumberOrderAction(tableNumber, qtyConsumer));
      };
    }, builder: (context, callback) {
      return new OpeningForm(callback);
    });
  }
}

class OpeningForm extends StatefulWidget {
  OpeningForm(this.callback);

  final OnAddTableNumber callback;

  @override
  OpeningFormState createState() {
    return new OpeningFormState();
  }
}

class OpeningFormState extends State<OpeningForm> {

  int tableNumber;

  int qtyConsumer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title:
             Text(
              'Olá! Seja bem vindo(a)!',
              textAlign: TextAlign.center,
              style: FontStyles.style,
              textScaleFactor: 1.5,
            ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Vamos começar?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 24.0,
                color: Colors.white,
              ),
              textScaleFactor: 1.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            width: 350.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: TextField(
              onChanged: (tableNumberCurrent) =>
                  this.tableNumber = int.parse(tableNumberCurrent),
              keyboardType: TextInputType.number,
              style: FontStyles.style1,
//              onFieldSubmitted: (tableNumberCurrent) => this.tableNumber = tableNumberCurrent,
              decoration: InputDecoration(
                  labelText: 'Número da mesa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: 350.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: TextField(
              keyboardType: TextInputType.number,
              style: FontStyles.style1,

              onChanged: (qtyConsumerCurrent) =>
                  this.qtyConsumer = int.parse(qtyConsumerCurrent),
              decoration: new InputDecoration(
                  labelText: 'Quantidade de pessoas',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none, color: Colors.white24,),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
              constraints: BoxConstraints.expand(width: 350.0, height: 90.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
              child: MaterialButton(
                onPressed: () {
//                  Navigator.pushNamed(context, '/main');
                  widget.callback(tableNumber, qtyConsumer);
                  ScanBarCode()
                      .scan()
                      .then((result) => resultOfBarCode(result));
                },
                height: 60.0,
                textTheme: ButtonTextTheme.primary,
                child: new Text(
                  'ABRIR MESA',
                  style: FontStyles.style2,
                  textScaleFactor: 1.5,
                ),
              )),
        ),
      ],
    );
  }

  resultOfBarCode(String result) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OpeningScan(result)),
    );
  }

//  openNextPage() {
////    Navigator.pop(context);
//
//  }
}

typedef OnAddTableNumber = Function(int tableNumber, int qtyConsumer);
