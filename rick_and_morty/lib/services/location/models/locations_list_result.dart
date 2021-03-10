import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/services/common/models/info/info.dart';
import 'package:rick_and_morty/services/location/models/location.dart';

part 'locations_list_result.g.dart';

@JsonSerializable()
class LocationsListResult{

  Info info;
  List<Location> results;

  LocationsListResult({this.info, this.results});

  factory LocationsListResult.fromJson(Map<String, dynamic> json) =>
      _$LocationsListResultFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsListResultToJson(this);
}