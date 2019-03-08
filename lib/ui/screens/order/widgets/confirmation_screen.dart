import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/ui/dialogs/confirm_dialog.dart';

class ConfirmationScreen extends StatelessWidget{

  ConfirmationScreen();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fitfood,
      body: new ConfirmDialog()
    );
  }
}