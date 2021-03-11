import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

abstract class BaseChip extends StatelessWidget {
  BaseChip({Key key, this.label, this.textColor, this.backgroundColor}) : super(key: key);

  String label;
  Color textColor;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}

class GreyChip extends BaseChip {
  GreyChip({key, label}) : super(key: key, label: label, textColor: Colors.white, backgroundColor: HexColor(CHIP_BG_COLOR));
}

