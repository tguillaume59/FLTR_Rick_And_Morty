import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/services/common/models/info/info.dart';

import 'character.dart';

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