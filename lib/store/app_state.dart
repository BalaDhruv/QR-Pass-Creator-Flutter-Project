import 'package:gpass/store/states/pass_state.dart';
import 'package:meta/meta.dart';

class AppState {
  final PassState passState;

  AppState({@required this.passState});

  factory AppState.initial() => AppState(passState: PassState.initial());
}
