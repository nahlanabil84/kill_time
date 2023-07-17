import 'package:kill_time/redux/random-joke/random_jokes_actions.dart';
import 'package:kill_time/redux/random-joke/random_jokes_state.dart';
import 'package:redux/redux.dart';

final randomJokeReducer = combineReducers<RandomJokeState>([
  TypedReducer<RandomJokeState, RandomJokeStatusAction>(
      _randomJokeStatus),
]);

RandomJokeState _randomJokeStatus(
    RandomJokeState state, RandomJokeStatusAction action) {
  var status = state.status;
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}
