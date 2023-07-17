import 'dart:async';
import 'package:kill_time/data/model/joke.dart';

import '../network_common.dart';

class RandomJokeRepository {
  const RandomJokeRepository();

  Future<Joke> getRandomJokes() {
    return NetworkCommon()
        /** Cat API **/
        // .dio.get("fact")
        .dio.get("random_joke")
        .then((d) {
      return Joke.fromJson(d.data);
    });
  }

}