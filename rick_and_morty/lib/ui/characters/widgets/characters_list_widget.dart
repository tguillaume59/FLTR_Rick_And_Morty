import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/characters/widgets/character_list_item.dart';

class CharactersListWidget extends StatelessWidget {
  CharactersListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: GridView.builder(
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (BuildContext context, int index) {
            return CharacterListItem();
          },
        ));
  }
}
