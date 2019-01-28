import 'package:gpass/model/pass.dart';
import 'package:gpass/store/actions/pass_action.dart';
import 'package:gpass/store/states/pass_state.dart';
import 'package:redux/redux.dart';

final passReducer = combineReducers<PassState>([
  TypedReducer<PassState, AddPassAction>(_addPass),
  TypedReducer<PassState, DeletePassAction>(_deletePass)
]);

PassState _addPass(PassState state, AddPassAction action) {
  print('adding pass');
  List<Pass> passes = []
    ..addAll(state.passes)
    ..add(action.pass);
  print(passes.toString());
  return state.success(passes);
}

// PassState _editPass(PassState state, EditPassAction action) {
//   print('adding pass');
//   List<Pass> passes = []
//     ..addAll(state.passes)
//     ..add(action.pass);
//   print(passes.toString());
//   return state.success(passes);
// }

PassState _deletePass(PassState state, DeletePassAction action) {
  print('delete pass');
  state.passes.removeWhere((pass) => pass.id == action.id);
  List<Pass> passes = []..addAll(state.passes);
  print(passes.toString());
  return state.success(passes);
}
