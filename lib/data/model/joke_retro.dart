import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_retro.g.dart';

@JsonSerializable()
class Joke {
  String? type;
  String? setup;
  String? punchline;
  int? id;

  Joke({this.type, this.setup, this.punchline, this.id});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

}
