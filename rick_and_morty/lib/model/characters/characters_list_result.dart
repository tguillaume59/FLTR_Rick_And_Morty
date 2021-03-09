import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/model/characters/character.dart';

part 'characters_list_result.g.dart';

@JsonSerializable()
class CharactersListResult{

  Info info;
  List<Character> results;

  CharactersListResult({this.info, this.results});

  factory CharactersListResult.fromJson(Map<String, dynamic> json) =>
      _$CharactersListResultFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListResultToJson(this);
}

@JsonSerializable()
class Info {

  int count;
  int pages;
  String next;
  String prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}