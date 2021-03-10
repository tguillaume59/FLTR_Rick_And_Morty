import 'package:rick_and_morty/services/characters/models/character.dart';
import 'package:rick_and_morty/services/characters/repositories/character_repository.dart';
import 'package:rick_and_morty/ui/common/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CharactersScreenBloc implements BaseBloc {
  CharactersScreenBloc(this._repository);

  final CharacterRepository _repository;
  ///
  /// - Lifecycle - ///
  ///
  @override
  void dispose() {
    _listCharactersStream.close();
  }

  ///
  /// - Streams - ///
  ///
  final _listCharactersStream = PublishSubject<List<Character>>();
  Stream<List<Character>> get listCharacters => _listCharactersStream.stream;

  ///
  /// - API request - ///
  ///
  fetchCharacters() async {
    var result = await _repository.getListCharacters();
    _listCharactersStream.sink.add(result);
    //_listCharactersStream.sink.addError(); //todo
  }
}