
import '../action_report.dart';

class GetRandomJokeAction {
  final String actionName = "GetRandomJokeAction";
  GetRandomJokeAction();
}

class RandomJokeStatusAction {
  final String actionName = "RandomJokeStatusAction";
  final ActionReport report;

  RandomJokeStatusAction({required this.report});
}
