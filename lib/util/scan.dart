import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peddi_tont_app/ui/dialogs/success_dialog.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanBarCode {
  String _reader;
  Permission permission = Permission.Camera;
  BuildContext context;

  Future<String> scan() async {
    try {
      var reader = await BarcodeScanner.scan();

      _reader = reader;
      return _reader;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        requestPermission(context);
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

  requestPermission(BuildContext context) async {
    await SimplePermissions.requestPermission(permission);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog("Permissão para leitura QRCode.");
        });
  }
}
