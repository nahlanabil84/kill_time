import '../random-joke/random_jokes_reducer.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
     return AppState(
      randomJokeState: randomJokeReducer(state.randomJokeState, action),
    );

}
