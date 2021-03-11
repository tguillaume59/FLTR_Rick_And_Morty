import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/characters/characters_screen_bloc.dart';
import 'package:rick_and_morty/ui/characters/widgets/characters_list_widget.dart';

class CharactersScreen extends StatefulWidget {
  final CharactersScreenBloc bloc;

  CharactersScreen({Key key, this.bloc}) : super(key: key);

  @override
  _CharactersScreenState createState() {
    return _CharactersScreenState();
  }
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    /**
     * Astuce pour faire de l'async dans le initState
     */
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //widget.bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await _loadData(),
      child: StreamBuilder(
          stream: widget.bloc.listCharacters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return CharactersListWidget(listCharacters: snapshot.data);
            }
            if (snapshot.hasError) {
              return Text("Erreur");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  //region functions
  _loadData() async {
    await widget.bloc.fetchCharacters();
  }
//endregion
}
