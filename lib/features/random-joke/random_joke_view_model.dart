import 'package:redux/redux.dart';

// import '../../data/model/joke.dart';
import '../../data/model/joke_retro.dart';
import '../../redux/action_report.dart';
import '../../redux/app/app_state.dart';
import '../../redux/random-joke/random_jokes_actions.dart';

class RandomJokeViewModel {
  final Function()? getRandomJoke;
  final Joke? joke;
  final ActionReport? getRandomJokeReport;

  RandomJokeViewModel({
    this.getRandomJoke,
    this.joke,
    this.getRandomJokeReport,
  });

  static RandomJokeViewModel fromStore(Store<AppState> store) {
    return RandomJokeViewModel(
      getRandomJoke: (){
        store.dispatch(GetRandomJokeAction());
      },
      joke: store.state.randomJokeState.joke,
      getRandomJokeReport: store.state.randomJokeState.status["GetRandomJokeAction"],
    );
  }
}
