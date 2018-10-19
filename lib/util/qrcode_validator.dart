import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:peddi_tont_app/models/responsible_employee.dart';
import 'package:peddi_tont_app/ui/dialogs/error_dialog.dart';
import 'package:peddi_tont_app/ui/screens/order/widgets/confirmation_screen.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/opening.dart';

class QrCodeValidator {


  static void qrCode(List<ResponsibleEmployee> responsaveis, String nameDes, BuildContext context) {
    if (responsaveis.where((r)=> r.epocId==nameDes).isNotEmpty){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Opening()),
      );
    }
    else {
      showDialog<ErrorDialog>(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(new Object(), "QrCode não cadastrado!");
          });
    }

  }

}