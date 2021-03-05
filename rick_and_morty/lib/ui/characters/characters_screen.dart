import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/characters/widgets/character_list_item.dart';
import 'package:rick_and_morty/ui/characters/widgets/characters_list_widget.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({Key key}) : super(key: key);

  @override
  _CharactersScreenState createState() {
    return _CharactersScreenState();
  }
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CharactersListWidget();
  }
}