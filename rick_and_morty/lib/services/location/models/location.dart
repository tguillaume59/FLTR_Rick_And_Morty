import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

/**
 * command line to generate JSON
 * flutter packages pub run build_runner build --delete-conflicting-outputs
 */
@JsonSerializable()
class Location {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  String created;

  Location(
      {this.id,
        this.name,
        this.type,
        this.dimension,
        this.residents,
        this.url,
        this.created});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}