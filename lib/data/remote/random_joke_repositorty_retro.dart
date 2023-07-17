import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/joke_retro.dart';

part 'random_joke_repositorty_retro.g.dart';

@RestApi()
abstract class RandomJokeRepository {
  factory RandomJokeRepository(Dio dio) = _RandomJokeRepository;

  @GET("random_joke")
  Future<Joke> getRandomJokes();
}
