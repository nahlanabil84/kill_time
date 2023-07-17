// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_retro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      type: json['type'] as String?,
      setup: json['setup'] as String?,
      punchline: json['punchline'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'type': instance.type,
      'setup': instance.setup,
      'punchline': instance.punchline,
      'id': instance.id,
    };
