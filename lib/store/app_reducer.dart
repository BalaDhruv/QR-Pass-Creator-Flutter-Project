import 'package:gpass/store/app_state.dart';
import 'package:gpass/store/reducers/pass_reducer.dart';

AppState appReducer(AppState state, action) =>
    AppState(passState: passReducer(state.passState, action));
