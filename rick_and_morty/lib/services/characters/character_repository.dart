import 'package:rick_and_morty/model/characters/character.dart';
import 'package:rick_and_morty/services/characters/character_services.dart';

class CharacterRepository{

  final CharacterApiServices client;

  CharacterRepository(this.client);

  Future<List<Character>> getListCharacters() async => await client.getCharactersList();

  Future<Character> getCharacterById(int id) async => await client.getCharactersById(id);

}