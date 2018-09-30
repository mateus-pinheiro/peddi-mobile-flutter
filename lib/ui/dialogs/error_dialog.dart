import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(this.error, this.message);

  final Object error;
  final String message;

  void show(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 5));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    show(context);
    return new Column(
      children: <Widget>[
        Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                color: AppColors.error_red,
                child: Center(
                    child: Text(
                  message == null
                      ? 'Houve um erro em enviar o seu pedido para a cozinha! Por favor, chame o garçom.'
                      : message,
                  style: FontStyles.feedbackStyle,
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
