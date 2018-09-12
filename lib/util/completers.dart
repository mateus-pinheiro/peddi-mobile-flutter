import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/screens/dialogs/error_dialog.dart';
import 'package:peddi_tont_app/screens/dialogs/success_dialog.dart';
import 'package:peddi_tont_app/screens/lists/snackbar_row.dart';

Completer<Null> snackBarCompleter(BuildContext context, String message,
    {bool shouldPop = false}) {
  final Completer<Null> completer = Completer<Null>();

  completer.future.then((_) {

    print('Enviado pelo completer');
    if (shouldPop) {
      Navigator.of(context).pop();
    }

    showDialog<SuccessDialog>(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog();
        });

  }).catchError((Object error) {
    showDialog<ErrorDialog>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(error);
        });
  });
  print('Não enviado pelo completer');

  return completer;
}
