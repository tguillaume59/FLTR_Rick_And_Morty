// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsListResult _$LocationsListResultFromJson(Map<String, dynamic> json) {
  return LocationsListResult(
    info: json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Location.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LocationsListResultToJson(
        LocationsListResult instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
