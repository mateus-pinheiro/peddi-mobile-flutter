import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class CartIndicateDialog extends StatelessWidget {
  CartIndicateDialog(this.message);

  final String message;

  void show(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 7));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    show(context);
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                color: AppColors.success_green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        message == null ? "" : message,
                        style: FontStyles.feedbackStyle,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 20.0,
                      color: AppColors.gray2,
                    ),
                  ],
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
