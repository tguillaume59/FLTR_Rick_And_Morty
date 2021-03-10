import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/characters/models/character.dart';
import 'package:rick_and_morty/ui/characters/widgets/character_list_item.dart';

class CharactersListWidget extends StatelessWidget {
  CharactersListWidget({Key key, this.listCharacters}) : super(key: key);

  final List<Character> listCharacters;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7
          ),
          itemBuilder: (BuildContext context, int index) {
            return CharacterListItem(character: listCharacters[index]);
          },
        ));
  }
}
