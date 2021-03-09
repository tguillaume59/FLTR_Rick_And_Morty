// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersListResult _$CharactersListResultFromJson(Map<String, dynamic> json) {
  return CharactersListResult(
    info: json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Character.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CharactersListResultToJson(
        CharactersListResult instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    count: json['count'] as int,
    pages: json['pages'] as int,
    next: json['next'] as String,
    prev: json['prev'] as String,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
