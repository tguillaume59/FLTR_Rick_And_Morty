import 'package:rick_and_morty/services/characters/clients/character_services.dart';
import 'package:rick_and_morty/services/characters/models/character.dart';
import 'package:rick_and_morty/services/characters/models/characters_list_result.dart';

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
      await client.getCharacterById(id);
}
