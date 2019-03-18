import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 180,
      width: 250,
      color: AppColors.peddi_white,
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
