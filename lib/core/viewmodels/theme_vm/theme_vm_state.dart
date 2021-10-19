import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fountain_fm/utils/colors.dart';

class ThemeVMState with EquatableMixin {
  final Color systemNavigationBarColor;

  const ThemeVMState({
    this.systemNavigationBarColor = kFountainGreen,
  });

  ThemeVMState copyWith({
    Color? systemNavigationBarColor,
  }) {
    return ThemeVMState(
      systemNavigationBarColor:
          systemNavigationBarColor ?? this.systemNavigationBarColor,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [systemNavigationBarColor];
}
