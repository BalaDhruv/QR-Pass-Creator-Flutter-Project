import 'package:gpass/model/pass.dart';
import 'package:meta/meta.dart';

class PassState {
  final bool isLoading;
  final List<Pass> passes;
  final String error;

  PassState(
      {@required this.isLoading, @required this.passes, @required this.error});

  factory PassState.initial() =>
      PassState(isLoading: false, passes: <Pass>[], error: null);

  PassState success(List<Pass> passes) =>
      PassState(isLoading: false, passes: passes, error: null);

  PassState copyWith({bool isLoading, List<Pass> passes, String error}) =>
      PassState(
        isLoading: isLoading ?? this.isLoading,
        passes: passes ?? this.passes,
        error: error ?? this.error,
      );
}
