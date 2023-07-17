import 'dart:async';
import 'package:kill_time/redux/random-joke/random_jokes_middleware.dart';
import 'package:redux/redux.dart';

import 'app/app_reducer.dart';
import 'app/app_state.dart';

Future<Store<AppState>> createStore() async {

  var store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [
        ...createRandomJokeMiddleware()]
  );
  return store;
}

