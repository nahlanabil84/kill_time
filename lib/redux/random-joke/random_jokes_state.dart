
import '../../data/model/joke.dart';
import '../action_report.dart';

class RandomJokeState {
  final Map<String, Joke> jokes;
  Joke? joke;
  final Map<String?, ActionReport> status;

  RandomJokeState({
    required this.jokes,
    required this.joke,
    required this.status,
  });

  factory RandomJokeState.initial() {
    return RandomJokeState(
      status: Map(),
      joke: null,
      jokes: Map(),
    );
  }

  RandomJokeState copyWith({
    Map<String, Joke>? jokes,
    Joke? joke,
    Map<String?, ActionReport>? status,
  }) {
    return RandomJokeState(
      jokes: jokes ?? this.jokes,
      joke: joke ?? this.joke,
      status: status ?? this.status,
    );
  }
}
