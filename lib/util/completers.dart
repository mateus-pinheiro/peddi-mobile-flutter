import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/ui/dialogs/error_dialog.dart';
import 'package:peddi_tont_app/ui/dialogs/success_dialog.dart';
import 'package:peddi_tont_app/ui/screens/main/main_app.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/opening.dart';

Completer<Null> snackBarCompleter(
    BuildContext context, String successMessage, String errorMessage,
    {bool shouldPop = false}) {
  final Completer<Null> completer = Completer<Null>();

  completer.future.then((_) {
    if (shouldPop) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }

    showDialog<SuccessDialog>(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(successMessage);
        });
  }).catchError((Object error) {
    showDialog<ErrorDialog>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(error, errorMessage);
        });
  });

  return completer;
}

Completer<Null> snackBarCompleterToOpening(
    BuildContext context, String successMessage, String errorMessage,
    {bool shouldPop = false}) {
  final Completer<Null> completer = Completer<Null>();

  completer.future.then((_) {
    if (shouldPop) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Opening()),
    );

    showDialog<SuccessDialog>(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(successMessage);
        });
  }).catchError((Object error) {
    showDialog<ErrorDialog>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(error, errorMessage);
        });
  });

  return completer;
}

Completer<Null> qrCodeCompleter(BuildContext context, String message,
    {bool shouldPop = false}) {
  final Completer<Null> completer = Completer<Null>();

  completer.future.then((_) {
    if (shouldPop) {
      Navigator.of(context).pop();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainApp()),
    );

    showDialog<MainApp>(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(message);
        });
  }).catchError((Object error) {
    showDialog<ErrorDialog>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(error, message);
        });
  });

  return completer;
}

Completer<Null> loginFlow(BuildContext context, String message,
    {bool shouldPop = false}) {
  final Completer<Null> completer = Completer<Null>();

  completer.future.then((_) {
    if (shouldPop) {
      Navigator.of(context).pop();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainApp()),
    );

    showDialog<MainApp>(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(message);
        });
  }).catchError((Object error) {
    Navigator.of(context).pop();
    showDialog<ErrorDialog>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(error, message);
        });
  });

  return completer;
}

Completer<Null> sendUpdateOrder(BuildContext context, String message,
    {bool shouldPop = false}) {
  final Completer<Null> completer = Completer<Null>();

  completer.future.then((itemsNotSent) {
//    if (itemsNotSent = !null) message += itemsNotSent.toString();

    if (shouldPop) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }

    showDialog<MainApp>(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(message);
        });
  }).catchError((Object error) {
    showDialog<ErrorDialog>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(error,
              "Houve um erro ao enviar alguns itens para a cozinha! Estes itens continuam no carrinho. Tente envia-los novamente ou chame o garçom.");
        });
  });

  return completer;
}
