//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:peddi_tont_app/models/app_state.dart';
//import 'package:peddi_tont_app/models/responsible_employee.dart';
//import 'package:peddi_tont_app/redux/actions.dart';
//import 'package:simple_permissions/simple_permissions.dart';
//
////class OpeningScan {
////
////  String _reader = '';
////  Permission permission = Permission.Camera;
////
////  final BuildContext context;
////
////  requestPermission() async {
////
////    var result = await SimplePermissions.requestPermission(permission);
////    showDialog<SuccessDialog>(
////        context: context,
////        builder: (BuildContext context) {
////          return SuccessDialog();
////        });
////  }
////
////
////  Future<String> scan() async {
////    try {
////      String reader = await BarcodeScanner.scan();
////
////
////
////      this._reader = reader;
////      return reader;
////    } on PlatformException catch (e) {
////      if (e.code == BarcodeScanner.CameraAccessDenied) {
////        requestPermission();
////        return _reader;
////      } else {
////        _reader = "unknown exception $e";
////        return _reader;
////      }
////    } on FormatException {
////      _reader =
////      'null (User returned using the "back"-button before scanning anything. Result)';
////      return _reader;
////    } catch (e) {
////      _reader = 'Unknown error: $e';
////      return _reader;
////    }
////  }
////
////
////
////}
//
////class OpeningScan extends StatefulWidget {
////  @override
////  _OpeningScan createState() => new _OpeningScan();
////
////  OpeningScan(this.context);
////
////  final BuildContext context;
////}
//
//class OpeningScan extends StatelessWidget{
//
//  String _reader;
//  OnAddQrCode callback;
//  Permission permission = Permission.Camera;
//  List<ResponsibleEmployee> responsibleEmployees;
//
//  @override
//  Widget build(BuildContext context) {
//    return new StoreConnector<AppState, OnAddQrCode>(converter: (store) {
//      print (store.state.restaurant.responsibleEmployee);
//      return (qrCode) {
//        store.dispatch(AddQrCode(qrCode));
//      };
//
//    }, builder: (context, callback) {
//      scan(context);
//    });
//  }
//
////  requestPermission() async {
////    var result = await SimplePermissions.requestPermission(permission);
////    showDialog<SuccessDialog>(
////        builder: (BuildContext context) {
////          return SuccessDialog();
////        });
////  }
//
//  Future<String> scan(BuildContext context) async {
//    try {
//      new StoreConnector<AppState, OnAddQrCode>(converter: (store) {
//        print (store.state.restaurant.responsibleEmployee);
//        return (qrCode) {
//          store.dispatch(AddQrCode(qrCode));
//        };
//
//      }, builder: (context, callback) {
//        scan(context);
//      });
//      _reader = await BarcodeScanner.scan();
//      responsibleEmployees
//          .forEach((f) => f.epocId == _reader ? callback(_reader) : null);
//
//      Navigator.pushNamed(context, '/main');
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
//}
//
//typedef OnAddQrCode = Function(String qrCode);
