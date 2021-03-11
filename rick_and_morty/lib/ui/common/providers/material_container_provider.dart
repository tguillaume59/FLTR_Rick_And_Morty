import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  MaterialContainer({Key key, this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: child);
  }
}

class MaterialContainerWrapContent extends StatelessWidget {
  MaterialContainerWrapContent(
      {Key key,
      this.child,
      this.marginLeft = 15.0,
      this.marginTop = 10.0,
      this.marginRight = 15.0,
      this.marginBottom = 10.0})
      : super(key: key);

  Widget child;

  double marginLeft;
  double marginTop;
  double marginRight;
  double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: (MediaQuery.of(context).size.width),
        margin: EdgeInsets.only(
            left: marginLeft,
            top: marginTop,
            right: marginRight,
            bottom: marginBottom),
        child: MaterialContainer(child: child));
  }
}
