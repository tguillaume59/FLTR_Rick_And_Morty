import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/model/characters/character.dart';
import 'package:rick_and_morty/ui/profile/profile_screen.dart';
import 'package:rick_and_morty/ui/profile/profile_screen_bloc.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

class CharacterListItem extends StatelessWidget {
  CharacterListItem({Key key, this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context, character.id),
      child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // pour garder les corner de la card
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                    child: Image.network(character.image, fit: BoxFit.cover)),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 8, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      character.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(TEXT_COLOR),
                                          fontSize: 14),
                                    ),
                                  ),
                                  Text(character.species,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(TEXT_COLOR_GREY),
                                          fontSize: 12)),
                                  Text(
                                    character.gender,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(TEXT_COLOR_GREY),
                                        fontSize: 12),
                                  )
                                ],
                              )),
                          character.status != "Alive"
                              ? Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    child: SvgPicture.asset(
                                        "assets/images/ic_memorial_grey.svg"),
                                  ))
                              : Container()
                        ],
                      )))
            ],
          )),
    );
  }

  onTap(BuildContext context, int id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(
                  profileScreenBloc: GetIt.I.get<ProfileScreenBloc>(),
                  id: id,
                )));
  }
}
