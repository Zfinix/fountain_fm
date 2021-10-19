import 'package:equatable/equatable.dart';

class LoaderVMState with EquatableMixin {
  final bool isLoading;
  final double? percent;

  const LoaderVMState({
    this.isLoading = false,
    this.percent,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [isLoading, percent ?? 0];

  LoaderVMState copyWith({
    bool? isLoading,
    double? percent,
  }) {
    return LoaderVMState(
      isLoading: isLoading ?? this.isLoading,
      percent: percent ?? this.percent,
    );
  }
}
