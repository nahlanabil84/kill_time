import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:kill_time/features/random-joke/random_joke_view_model.dart';

import '../../gen/assets.gen.dart';
import '../../redux/action_report.dart';
import '../../redux/app/app_state.dart';

class RandomJokeView extends StatelessWidget {
  const RandomJokeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RandomJokeViewModel>(
      distinct: true,
      converter: (store) => RandomJokeViewModel.fromStore(store),
      builder: (_, viewModel) =>
          RandomJokeViewContent(
            viewModel: viewModel,
          ),
    );
  }
}

class RandomJokeViewContent extends StatefulWidget {
  final RandomJokeViewModel? viewModel;

  const RandomJokeViewContent({Key? key, this.viewModel/*, this.joke*/}) : super(key: key);

  @override
  _RandomJokeViewContentState createState() =>
      _RandomJokeViewContentState();
}

class _RandomJokeViewContentState extends State<RandomJokeViewContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // widget.viewModel!.getRandomJoke!();
  }

  @override
  void didUpdateWidget(RandomJokeViewContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {});
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage(Assets.images.laugh.path,),height: 200,),
            const Gap(24),
            const Text(
              'Wanna read something funny?',
            style: TextStyle(color: Colors.black54),),
            (widget.viewModel!.getRandomJokeReport?.status ==
                ActionStatus.running)
                ? const CircularProgressIndicator()
                : widget.viewModel!.joke == null
                ? Container(child: const Gap(8),)
                : Column(
              children: [
                const Gap(8),
                Text(widget.viewModel!.joke!.setup!,
                  style: const TextStyle(fontWeight: FontWeight.bold),),
                const Gap(8),
                Text(widget.viewModel!.joke!.punchline!,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                /** Cat API **/
                //Text(widget.viewModel!.joke!.id.toString()),
              ],
            ),
            const Gap(8),
            ElevatedButton(
              onPressed: widget.viewModel!.getRandomJoke!,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  elevation: 0
              ),
              child: const Text('Get Random Joke',),

            ),
          ],
        ),
      ),
    );
  }
}