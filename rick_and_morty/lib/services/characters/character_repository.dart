import 'package:rick_and_morty/model/characters/character.dart';
import 'package:rick_and_morty/model/characters/characters_list_result.dart';
import 'package:rick_and_morty/services/characters/character_services.dart';

class CharacterRepository {
  final CharacterApiServices client;
  int totalCharacters = 0;

  CharacterRepository(this.client);

  Future<List<Character>> getListCharacters() async {
    CharactersListResult listCharacters = await client.getCharactersList();
    totalCharacters = listCharacters.info.count;
    return listCharacters.results;
  }

  Future<Character> getCharacterById(int id) async =>
      await client.getCharactersById(id);
}
