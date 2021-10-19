import 'package:fountain_fm/app/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class SplashVM extends StateNotifier {
  SplashVM(this.read) : super(null);

  final Reader read;

  /// Load Splash screen with persistent login logic
  void handleLoadSplash(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1800));

    /// Go to Home Page
    context.go(FountainPages.home);
  }
}
