import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

//region Base Text View
abstract class BaseTextView extends StatelessWidget {
  BaseTextView(
      {Key key,
      this.text = "",
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.textColor = Colors.black,
      this.marginLeft = 0,
      this.marginTop = 0,
      this.marginRight = 0,
      this.marginBottom = 0});

  String text;

  FontWeight fontWeight;
  double fontSize;
  Color textColor;

  double marginLeft;
  double marginTop;
  double marginRight;
  double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: marginLeft,
          top: marginTop,
          right: marginRight,
          bottom: marginBottom),
      child: Text(text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: fontWeight, color: textColor, fontSize: fontSize)),
    );
  }
}
//endregion Base Text View

//region Title Text View
abstract class BaseTitleTextView extends BaseTextView {
  BaseTitleTextView({key, text, textColor, fontSize, marginTop, marginLeft})
      : super(
            key: key,
            text: text,
            fontWeight: FontWeight.normal,
            textColor: textColor,
            fontSize: fontSize,
            marginTop: marginTop,
            marginLeft: marginLeft);
}

class BlackTitleTextView extends BaseTitleTextView {
  BlackTitleTextView({key, text, fontSize = 20.0, marginTop = 10.0, marginLeft = 0.0})
      : super(
            key: key,
            text: text,
            textColor: HexColor(TEXT_COLOR_BLACK),
            fontSize: fontSize,
            marginTop: marginTop,
            marginLeft: marginLeft);
}
//endregion Title Text View

//region Body Text View
abstract class BaseBodyTextView extends BaseTextView {
  BaseBodyTextView({key, text, fontWeight, textColor})
      : super(
            key: key,
            text: text,
            fontWeight: fontWeight,
            textColor: textColor,
            fontSize: 14,
            marginTop: 5.0,
            marginBottom: 5.0);
}

class BlackBodyTextView extends BaseBodyTextView {
  BlackBodyTextView({Key key, text})
      : super(
            text: text,
            fontWeight: FontWeight.normal,
            textColor: HexColor(TEXT_COLOR_BLACK));
}

class BlackBoldBodyTextView extends BaseBodyTextView {
  BlackBoldBodyTextView({Key key, text})
      : super(
            text: text,
            fontWeight: FontWeight.bold,
            textColor: HexColor(TEXT_COLOR_BLACK));
}

class GreyBodyTextView extends BaseBodyTextView {
  GreyBodyTextView({Key key, text})
      : super(
            text: text,
            fontWeight: FontWeight.bold,
            textColor: HexColor(TEXT_COLOR_GREY));
}
//endregion Body Text View
