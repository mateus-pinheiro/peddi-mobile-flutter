import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/models/rating.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/ui/dialogs/rating_dialog.dart';
import 'package:peddi_tont_app/util/completers.dart';

class OrderScan extends StatelessWidget {
  OrderScan(this._reader, this.order, this.categories, this.contextParent);

  final BuildContext contextParent;
  final String _reader;
  final Order order;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new StoreConnector<AppState, void>(
            converter: (store) {
//              store.dispatch(AddQrTicketCode(_reader, context));
              store.dispatch(SendOrder(store.state.order,
                  sendOrderCompleter(context, null, shouldPop: true)));
            },
            builder: (context, lk) => widget(context)));
  }

  void close(BuildContext context) async {
    await new Future.delayed(const Duration(milliseconds: 500));
    Navigator.pop(context);

  }

  Widget widget(BuildContext context) {
    close(context);
    return new Scaffold(
      body: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: new Center(child: new CircularProgressIndicator())),
    );
  }
}
