import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kill_time/redux/app/app_state.dart';
import 'package:kill_time/redux/store.dart';
import 'package:redux/redux.dart';

import 'features/random-joke/random_joke_view.dart';

Alice alice = Alice(showNotification: true);

Future<Null> main() async{
  var store = await createStore();
  runApp(MyApp(
    store
  ));}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          navigatorKey:alice.getNavigatorKey(),
          debugShowCheckedModeBanner: false,
          title: 'Kill time',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: RandomJokeView(),
        ),
    );
  }
}
