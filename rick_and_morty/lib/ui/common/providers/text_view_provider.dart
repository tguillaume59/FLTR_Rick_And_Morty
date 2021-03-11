import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

class TextViewProvider {
  //region public methods
  Container buildBlackBodyTextView({String text}) {
    return _buildBodyTextView(
        text: text,
        color: HexColor(TEXT_COLOR_BLACK),
        fontWeight: FontWeight.normal);
  }

  Container buildBlackBoldBodyTextView({String text}) {
    return _buildBodyTextView(
        text: text,
        color: HexColor(TEXT_COLOR_BLACK),
        fontWeight: FontWeight.bold);
  }

  Container buildGreyBodyTextView({String text}) {
    return _buildBodyTextView(
        text: text,
        color: HexColor(TEXT_COLOR_GREY),
        fontWeight: FontWeight.normal);
  }

  //endregion public methods

  //region private methods
  Container _buildBodyTextView(
      {String text, Color color, FontWeight fontWeight}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: fontWeight, color: color, fontSize: 14)),
    );
  }
//endregion private methods
}
