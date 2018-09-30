import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/util/completers.dart';

class OrderScan extends StatelessWidget {
  OrderScan(this._reader, this.order);

  final String _reader;
  final Order order;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new StoreConnector(
          converter: (store) => store.dispatch(AddQrTicketCode(_reader, context)),
          builder: (context, f) => new Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Text(order.ticket.toString()),
              )),
    );
  }
}
