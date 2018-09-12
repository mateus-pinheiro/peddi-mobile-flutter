import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/screens/buttons/elevated_button.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(this.error);
  final Object error;

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
                  'Houve um erro em enviar o seu pedido para a cozinha! Por favor, chame o garçom.',
                  style: FontStyles.feedbackStyle,
                )),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

//  @override
//  Widget build(BuildContext context) {
//
//    return Padding(
//      padding: EdgeInsets.all(16.0),
//      child: Column(
//        children: <Widget>[
//          Material(
//            child: Padding(
//              padding: const EdgeInsets.all(28.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Text("Ocorreu um erro",
//                      style: Theme.of(context).textTheme.title),
//                  SizedBox(height: 20.0),
//                  Text(error.toString()),
//                  SizedBox(height: 40.0),
//                  ElevatedButton(
//                    onPressed: () => Navigator.of(context).pop(),
//                    label: 'Fechar',
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Expanded(child: Container()),
//        ],
//      ),
//    );
//  }
}
