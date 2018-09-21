import 'package:flutter/material.dart';

void main() => runApp(new QorderApp());

class QorderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'qorder',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('qorder'),
        ),
        body: new Center(
          child: new Text('qorder'),
        ),
      ),
    );
  }
}
