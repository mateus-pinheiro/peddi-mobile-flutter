import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/responsible_employee.dart';
import 'package:peddi_tont_app/redux/actions.dart';
import 'package:peddi_tont_app/ui/dialogs/error_dialog.dart';
import 'package:peddi_tont_app/ui/screens/main/main_app.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/opening.dart';
import 'package:peddi_tont_app/util/completers.dart';
import 'package:simple_permissions/simple_permissions.dart';

//class OpeningScan {
//
//  String _reader = '';
//  Permission permission = Permission.Camera;
//
//  final BuildContext context;
//
//  requestPermission() async {
//
//    var result = await SimplePermissions.requestPermission(permission);
//    showDialog<SuccessDialog>(
//        context: context,
//        builder: (BuildContext context) {
//          return SuccessDialog();
//        });
//  }
//
//
//  Future<String> scan() async {
//    try {
//      String reader = await BarcodeScanner.scan();
//
//
//
//      this._reader = reader;
//      return reader;
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        requestPermission();
//        return _reader;
//      } else {
//        _reader = "unknown exception $e";
//        return _reader;
//      }
//    } on FormatException {
//      _reader =
//      'null (User returned using the "back"-button before scanning anything. Result)';
//      return _reader;
//    } catch (e) {
//      _reader = 'Unknown error: $e';
//      return _reader;
//    }
//  }
//
//
//
//}

//class OpeningScan extends StatefulWidget {
//  @override
//  _OpeningScan createState() => new _OpeningScan();
//
//  OpeningScan(this.context);
//
//  final BuildContext context;
//}

class OpeningScan extends StatelessWidget {
  OpeningScan(this._reader);

  final String _reader;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<ResponsibleEmployee>>(
        converter: (store) => store.state.restaurant.responsibleEmployee,
        builder: (context, responsibleEmployees) {
          if (responsibleEmployees
              .where((responsible) => responsible.epocId == int.parse(_reader))
              .isNotEmpty) {
            return new StoreConnector<AppState, void>(
              converter: (store) => store.dispatch(AddQrCode(
                  _reader,
                  qrCodeCompleter(context, 'Seja muito bem atendido!',
                      shouldPop: true))),
              builder: (context, w) {
                return new Container(
                  color: Colors.yellow,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                );
              },
            );
          } else
            return new Opening();
        });
  }

//  requestPermission() async {
//    var result = await SimplePermissions.requestPermission(permission);
//    showDialog<SuccessDialog>(
//        builder: (BuildContext context) {
//          return SuccessDialog();
//        });
//  }
//
//  Future<String> scan() async {
//    try {
//      var reader = await BarcodeScanner.scan();
//
//      _reader = reader;
//      return _reader;
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
////        requestPermission();
//        return _reader;
//      } else {
//        _reader = "unknown exception $e";
//        return _reader;
//      }
//    } on FormatException {
//      _reader =
//          'null (User returned using the "back"-button before scanning anything. Result)';
//      return _reader;
//    } catch (e) {
//      _reader = 'Unknown error: $e';
//      return _reader;
//    }
//  }
//
//  FutureOr compareQrCode(String value) {
//
//     return new Container(
//       child: new StoreConnector<AppState, List<ResponsibleEmployee>>(
//          converter: (store) => store.state.restaurant.responsibleEmployee,
//          builder: (context, responsibleEmployee) {
//            if (responsibleEmployee.contains(_reader)) {
//              return new Container(color: Colors.yellow, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,);
//            }
//            else
//              return new Container(color: Colors.blue, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,);
//
//          }),
//     );
//  }
}

//typedef OnAddQrCode = Function(String qrCode);
