import 'package:fountain_fm/core/viewmodels/loader_vm/loader_vm_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class LoaderVM extends StateNotifier<LoaderVMState> {
  final Reader read;

  LoaderVM(this.read) : super(const LoaderVMState());

  set isLoading(bool val) {
    state.copyWith(isLoading: val);
  }

  set percent(double? val) {
    state.copyWith(percent: val);
  }

  /// Run Task and show loading
  void simulate(
    Function() callback, {
    Duration duration = const Duration(seconds: 2),
  }) async {
    /// Start Loading
    isLoading = true;

    /// Run delayed Task
    await Future.delayed(duration);

    /// End Loading
    isLoading = false;

    callback.call();
  }

  /// Run Task and show loading
  void runTask<T>(Future Function()? task) async {
    /// Load
    isLoading = true;

    /// Run async Task
    if (task != null) await task.call();

    /// Stop Loading
    isLoading = false;
  }
}
