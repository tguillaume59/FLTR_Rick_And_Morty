import 'package:rick_and_morty/services/characters/models/character.dart';
import 'package:rick_and_morty/services/characters/repositories/character_repository.dart';
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

  ///
  /// - DATA MANAGEMENT - ///
  ///
  List<String> getListEpisodes(List<String> listUrl) {
    List<String> listNumEpisodes = [];
    String numEpisode = "";

    listUrl.forEach((String url) {
      int lastIndex = url.lastIndexOf('/');

      if (lastIndex >= 0 && lastIndex < url.length) {
        numEpisode = "";
        numEpisode = url.substring(lastIndex + 1, url.length);
        listNumEpisodes.add(numEpisode);
      }
    });

    return listNumEpisodes;
  }

  int getTotalCharacters(){
    return _repository.totalCharacters;
  }
}
