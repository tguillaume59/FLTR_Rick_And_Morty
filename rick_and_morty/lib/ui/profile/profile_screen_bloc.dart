import 'package:rick_and_morty/model/characters/character.dart';
import 'package:rick_and_morty/services/characters/character_repository.dart';
import 'package:rick_and_morty/ui/common/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ProfileScreenBloc implements BaseBloc {
  ProfileScreenBloc(this._repository);

  final CharacterRepository _repository;
  ///
  /// - Lifecycle - ///
  ///
  @override
  void dispose() {
    _characterStream.close();
  }

  ///
  /// - Streams - ///
  ///
  final _characterStream = PublishSubject<Character>();
  Stream<Character> get character => _characterStream.stream;

  ///
  /// - API request - ///
  ///
  fetchCharacter(int id) async {
    var result = await _repository.getCharacterById(id);
    _characterStream.sink.add(result);
    //_listCharactersStream.sink.addError(); //todo
  }
}