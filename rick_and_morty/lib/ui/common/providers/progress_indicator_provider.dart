import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  CircularLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: CircularProgressIndicator());
  }
}
