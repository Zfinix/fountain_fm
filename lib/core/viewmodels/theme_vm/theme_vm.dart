import 'dart:io';

import 'package:fountain_fm/core/viewmodels/theme_vm/theme_vm_state.dart';
import 'package:fountain_fm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeVM extends StateNotifier<ThemeVMState> {
  final Reader read;
  ThemeVM(this.read) : super(const ThemeVMState());

  set systemNavigationBarColor(Color color) {
    state = state.copyWith(systemNavigationBarColor: color);
  }

  /// Toggle Bottom Nav bar color between white and green
  void toggleBottomNavColor() {
    systemNavigationBarColor = state.systemNavigationBarColor == kBackground
        ? kFountainGreen
        : kBackground;
  }

  /// App's Theme data
  ThemeData get themeData => ThemeData(
        primaryColor: kFountainGreen,
        brightness: Brightness.light,
        fontFamily: 'CerebriSans',
        backgroundColor: kBackground,
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: kFountainGreen,
            selectionHandleColor: kFountainGreen,
            selectionColor: kFountainGreen.withOpacity(0.1)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  /// Force potriat mode for app
  void handlePortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// System overlay style
  SystemUiOverlayStyle get style => SystemUiOverlayStyle(
        /* set Status bar color in Android devices. */
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        /* set Status bar icons color in Android devices.*/
        statusBarIconBrightness:
            (Platform.isIOS ? Brightness.light : Brightness.dark),
        /* set Status bar icon color in iOS. */
        statusBarBrightness: Brightness.dark,
        //systemNavigationBarColor: ,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
}
