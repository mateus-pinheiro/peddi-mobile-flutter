import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/redux/actions.dart';


class OpeningFormRoute extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnAddTableNumber>(
        converter: (store) {
          return (tableNumber, qtyConsumer) {
            store.dispatch(new LoadRestaurantAction());
            store.dispatch(AddTableNumberOrderAction(tableNumber, qtyConsumer));
          };
        }, builder: (context, callback) {
      return new OpeningForm(callback);
    });
  }
}



class OpeningForm extends StatelessWidget {

  OpeningForm(this.callback);

  final OnAddTableNumber callback;

  String tableNumber;
  String qtyConsumer;

//  @override
//  Widget build(BuildContext context) {
//    return new Form(
//        child: ListView(
//      children: <Widget>[
//        new TextFormField(
//          keyboardType: TextInputType.number,
//          decoration: new InputDecoration(
//              hintText: 'Número da mesa',
//              border: new UnderlineInputBorder(
//                  borderSide: BorderSide(
//                      style: BorderStyle.solid,
//                      width: 1.0,
//                      color: Colors.black))),
//          onSaved: (String value) => this.tableNumber = value,
//        ),
//        new TextFormField(
//          keyboardType: TextInputType.number,
//          decoration: new InputDecoration(hintText: 'Quantidade de pessoas'),
//          onSaved: (String value) => this.qtyConsumer = value,
//        )
//      ],
//    ));
//  }

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
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 38.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
              onChanged: (tableNumberCurrent) => this.tableNumber = tableNumberCurrent,
              keyboardType: TextInputType.number,
              style: TextStyle(
//                fontFamily: 'CircularStd',
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
//              onFieldSubmitted: (tableNumberCurrent) => this.tableNumber = tableNumberCurrent,
              decoration: InputDecoration(
                  labelText: 'Número da mesa',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none, color: Colors.yellow),
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
              style: TextStyle(
//                fontFamily: 'CircularStd',
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (qtyConsumerCurrent) => this.qtyConsumer = qtyConsumerCurrent,

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
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ],
    );
  }

}

typedef OnAddTableNumber = Function(String tableNumber, String qtyConsumer);
