import '../random-joke/random_jokes_state.dart';

class AppState {
  final RandomJokeState randomJokeState;

  AppState({
    required this.randomJokeState,
  });

  factory AppState.initial() {
    return AppState(
      randomJokeState: RandomJokeState.initial(),
    );
  }
}
