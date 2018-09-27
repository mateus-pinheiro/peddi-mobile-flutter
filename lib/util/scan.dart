import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peddi_tont_app/ui/dialogs/success_dialog.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/widgets/opening_scan.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanBarCode extends StatefulWidget{
  String _reader;
  Permission permission = Permission.Camera;


  resultOfBarCode(String result) {
    new OpeningScan(result);
  }

  Future<String> scan() async {
    try {
      var reader = await BarcodeScanner.scan();

      _reader = reader;
      resultOfBarCode(_reader);
      return _reader;

    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        requestPermission();
        return _reader;
      } else {
        _reader = "unknown exception $e";
        return _reader;
      }
    } on FormatException {
      _reader =
          'null (User returned using the "back"-button before scanning anything. Result)';
      return _reader;
    } catch (e) {
      _reader = 'Unknown error: $e';
      return _reader;
    }
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }

//  requestPermission() async {
//    await SimplePermissions.requestPermission(permission);
//    showDialog<SuccessDialog>(builder: (BuildContext context) {
//      return SuccessDialog();
//    });
//  }
}


