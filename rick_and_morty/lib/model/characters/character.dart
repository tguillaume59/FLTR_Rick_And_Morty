import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

/**
 * command line to generate JSON
 * flutter packages pub run build_runner build --delete-conflicting-outputs
 */

@JsonSerializable()
class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Origin location;
  String image;
  List<String> episode;
  String url;
  String created;

  Character(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  String name;
  String url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) =>
      _$OriginFromJson(json);
  Map<String, dynamic> toJson() => _$OriginToJson(this);
}