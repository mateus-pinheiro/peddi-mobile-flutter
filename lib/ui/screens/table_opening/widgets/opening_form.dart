import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/widgets/opening_scan.dart';
import 'package:peddi_tont_app/util/completers.dart';
import 'package:peddi_tont_app/util/scan.dart';


bool _loadingInProgress;
class OpeningFormRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnAddTableNumber>(converter: (store) {
      return (tableNumber, qtyConsumer) {
        store.dispatch(new LoadRestaurantAction(
            context, tableNumber, qtyConsumer, loginFlow(context, "Não conseguimos recuperar os dados do restaurante, por favor tente novamente!")));
//        store.dispatch(new OpenOrderAction(tableNumber, qtyConsumer));
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
  void initState() {
    // TODO: implement initState
    _loadingInProgress = true;
    super.initState();
  }

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
              style: FontStyles.style,
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
                color: AppColors.gray5,
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
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: 280.0,
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
                      color: AppColors.peddi_black,
                      width: 3.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
              child: MaterialButton(
                color: AppColors.fitfood1,
                onPressed: () {
//                  Navigator.pushNamed(context, '/main');
                  widget.callback(tableNumber, qtyConsumer);

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

  resultOfBarCode(String result) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OpeningScan(result)),
    );
  }

  openNextPage() {
//    Navigator.pop(context);
  }
}

typedef OnAddTableNumber = Function(int tableNumber, int qtyConsumer);
