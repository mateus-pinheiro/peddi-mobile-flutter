import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class SuccessDialog extends StatelessWidget {
  void show(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 3));
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
                color: AppColors.success_green,
                child: Center(
                    child: Text(
                  'O seu pedido foi enviado com sucesso!',
                  style: FontStyles.feedbackStyle,
                )
                ),
              ),
            ],
          ),
        ),
//        Expanded(child: Container()),
      ],
    );
  }
}
