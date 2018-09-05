import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';


class OpeningFormRoute extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnAddTableNumber>(
        converter: (store) {
          return (tableNumber, qtyConsumer) {
            store.dispatch(new LoadRestaurantAction());
            store.dispatch(new AddTableNumberOrderAction(tableNumber, qtyConsumer));
          };
        }, builder: (context, callback) {
      return new OpeningForm(callback);
    });
  }
}



class OpeningForm extends StatelessWidget {

  OpeningForm(this.callback);

  final OnAddTableNumber callback;

  int tableNumber;
  int qtyConsumer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Olá! Seja bem vindo(a)!',
              textAlign: TextAlign.center,
              style: FontStyles.style ,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Vamos começar?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 280.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: TextField(
              onChanged: (tableNumberCurrent) => this.tableNumber = int.parse(tableNumberCurrent),
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
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: 280.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: TextField(
              keyboardType: TextInputType.number,
             style: FontStyles.style1,
              onChanged: (qtyConsumerCurrent) => this.qtyConsumer = int.parse(qtyConsumerCurrent),

              decoration: new InputDecoration(
                  labelText: 'Quantidade de pessoas',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none, color: Colors.white24),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              constraints: BoxConstraints.expand(width: 280.0, height: 80.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                  callback(tableNumber, qtyConsumer);
                },

                height: 60.0,
                textTheme: ButtonTextTheme.primary,
                child: new Text(
                  'ABRIR MESA',
                  style: FontStyles.style2,
                ),
              )),
        ),
      ],
    );
  }

}

typedef OnAddTableNumber = Function(int tableNumber, int qtyConsumer);
