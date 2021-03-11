import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

abstract class BaseBodyTextView extends StatelessWidget {
  BaseBodyTextView({Key key, this.text, this.fontWeight, this.color})
      : super(key: key);

  String text;
  FontWeight fontWeight;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: fontWeight, color: color, fontSize: 14)),
    );
  }
}

class BlackBodyTextView extends BaseBodyTextView {
  BlackBodyTextView({Key key, text})
      : super(
            text: text,
            fontWeight: FontWeight.normal,
            color: HexColor(TEXT_COLOR_BLACK));
}

class BlackBoldBodyTextView extends BaseBodyTextView {
  BlackBoldBodyTextView({Key key, text})
      : super(
            text: text,
            fontWeight: FontWeight.bold,
            color: HexColor(TEXT_COLOR_BLACK));
}

class GreyBodyTextView extends BaseBodyTextView {
  GreyBodyTextView({Key key, text})
      : super(
            text: text,
            fontWeight: FontWeight.bold,
            color: HexColor(TEXT_COLOR_GREY));
}
