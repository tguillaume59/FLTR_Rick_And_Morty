import 'package:dio/dio.dart';
import 'package:rick_and_morty/model/characters/character.dart';

class CharacterApiServices {
  final Dio _dio;

  CharacterApiServices(this._dio);

//get Data Json
  Future<dynamic> _getData(url) async {
    try {
      final response = await _dio.get(
        "https://rickandmortyapi.com/api/$url",
        options: Options(
          headers: {'accept': 'application/json'},
        ),
      );
      return response.data;
    } on DioError catch (error, stacktrace) {
      if (error.response != null) {
        switch (error.response.statusCode) {
          default:
            print(error.message);
        }
      } else {
        print(error.message);
      }
    } catch (error) {
      // Other error ? Looks like a bad thing
      throw error;
    }
  }

  Future<List<Character>> getCharactersList() async {
    var data = await _getData("/character");
    List<dynamic> characterData = data['results'];
    List<Character> charactersList = characterData.map((f) => Character.fromJson(f)).toList();
    return charactersList;
  }

  Future<Character> getCharactersById(int id) async {
    var data = await _getData("/character/$id");
    Character character = Character.fromJson(data);
    return character;
  }
}

