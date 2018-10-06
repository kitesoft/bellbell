import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'dart:convert';

class QRScreen extends StatefulWidget {
  @override
  State createState() => new QRScreenState();
}

class QRScreenState extends State<QRScreen> {
  String _scanRe = "";
  Map<String, dynamic> _result = Map<String, dynamic>();

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _scanRe = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _scanRe = "Camera permission was denied";
        });
      } else {
        setState(() {
          _scanRe = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        _scanRe = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        _scanRe = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_scanRe.length == 0) {
      _scanQR();
    }

    try {
      _result = json.decode(_scanRe);
      print(_result);
    } on FormatException {
      print("invalid format");
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text("QR Code")),
      body: new Center(child: new Text("Wrong QR!, Please Rescan")),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
