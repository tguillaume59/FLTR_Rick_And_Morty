import 'package:rick_and_morty/services/characters/models/character.dart';
import 'package:rick_and_morty/services/characters/models/characters_list_result.dart';
import 'package:rick_and_morty/services/common/base_services.dart';

class CharacterApiServices extends BaseApiServices {
  CharacterApiServices(dio) : super(dio);

  Future<List<Character>> getOnlyCharactersList() async {
    var data = await getData("/character");
    List<dynamic> characterData = data['results'];
    List<Character> charactersList =
        characterData.map((f) => Character.fromJson(f)).toList();
    return charactersList;
  }

  Future<CharactersListResult> getCharactersList() async {
    var data = await getData("/character");
    CharactersListResult charactersList = CharactersListResult.fromJson(data);
    return charactersList;
  }

  Future<Character> getCharacterById(int id) async {
    var data = await getData("/character/$id");
    Character character = Character.fromJson(data);
    return character;
  }
}
