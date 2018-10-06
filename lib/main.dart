import 'package:flutter/material.dart';
import 'package:bellbell/screen/qrscreen.dart';
import 'package:bellbell/common/connector.dart';

void main() {
  ServiceConnector.addBooks();
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    home: QRScreen(),
  ));
}
