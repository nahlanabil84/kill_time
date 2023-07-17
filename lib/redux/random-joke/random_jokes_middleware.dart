// import 'package:kill_time/data/remote/random_repository.dart';
import 'package:kill_time/redux/random-joke/random_jokes_actions.dart';
import 'package:redux/redux.dart';

import '../../data/model/joke_retro.dart';
import '../../data/network_common.dart';
import '../../data/remote/random_joke_repositorty_retro.dart';
import '../action_report.dart';
import '../app/app_state.dart';

List<Middleware<AppState>> createRandomJokeMiddleware([
  // RandomJokeRepository _repository = const RandomJokeRepository(),]) {
  RandomJokeRepository? _repository,
]) {
  _repository = RandomJokeRepository(NetworkCommon().dio);

  final getRandomJoke = _createGetRandomJoke(_repository);

  return [TypedMiddleware<AppState, GetRandomJokeAction>(getRandomJoke),];
}

Middleware<AppState> _createGetRandomJoke(RandomJokeRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
      running(next, action);
      store.state.randomJokeState!.joke = null;
      repository.getRandomJokes().then((joke) {
        store.state.randomJokeState!.joke = joke;
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
  };
}

void catchError(NextDispatcher next, action, error) {
  next(RandomJokeStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(RandomJokeStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(RandomJokeStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more jokes")));
}

void running(NextDispatcher next, action) {
  next(RandomJokeStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(RandomJokeStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "No more jokes available")));
}