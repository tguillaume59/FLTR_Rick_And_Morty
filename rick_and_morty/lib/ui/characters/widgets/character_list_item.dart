import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

class CharacterListItem extends StatelessWidget {
  CharacterListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 300,
      child: Card(
          child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                child: Image.network(
                    "https://static.wikia.nocookie.net/the-100/images/8/87/Red_Sun_Rising_6x02_%281%29.jpg/revision/latest?cb=20190515222244&path-prefix=fr",
                    fit: BoxFit.cover)),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nom - prenom",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor(TEXT_COLOR),
                                fontSize: 14),
                          ),
                          Text("Espèce",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor(TEXT_COLOR_GREY),
                              fontSize: 12)
                          ),
                          Text("Genre",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor(TEXT_COLOR_GREY),
                                fontSize: 12),
                          )
                        ],
                      )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: 32,
                            height: 32,
                            child: SvgPicture.asset(
                            "assets/images/ic_memorial_grey.svg"),
                      ))
                    ],
                  )))
        ],
      )),
    );
  }
}
