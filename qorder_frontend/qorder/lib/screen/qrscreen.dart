import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qorder/common/connector.dart';
import 'dart:async';

class QRScreen extends StatefulWidget{
  @override
  State createState() => new QRScreenState();
}

class QRScreenState extends State<QRScreen>{
  String _result = "";
  final String _host = Connector.host;

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _result = "Camera permission was denied";
        });
      } else {
        setState(() {
          _result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        _result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        _result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context){
    if(_result == _host.substring(0, _result.length))
      print("here");
    if(_result.length == 0)
      _scanQR();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("QR Code")
      ),
      body: new Center(
        child: new Text("Wrong QR!, Please Rescan")
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}