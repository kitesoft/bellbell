import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget{
  final double _barHeight = 66.0;
  String title;

  CustomAppbar({this.title})

  @override
  Widget build(BuildContext context){
    final double statusHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: new EdgeInsets.only(top: statusHeight),
      height: _barHeight + statusHeight,
      child: new Center(
        child: new Text(title),
      ),
      color: Colors.white,
    );

  }

}