import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    color: Colors.purple,
                    child: Image.network(
                      "https://static.wikia.nocookie.net/the-100/images/8/87/Red_Sun_Rising_6x02_%281%29.jpg/revision/latest?cb=20190515222244&path-prefix=fr",
                      fit: BoxFit.cover
                    )
                  ),

                ),
              Expanded(
                  flex: 2,
                  child: Container(
                      color: Colors.pink,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Nom - prenom"),
                            Text("Espèce"),
                            Text("Genre")
                          ],
                        ),
                        Container(
                          child: SvgPicture.asset("assets/images/ic_memorial_grey.svg"),
                        )
                      ],
                  )
                  )
              )
            ],
          )
      ),
    );
  }
}
