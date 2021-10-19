import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'package:fountain_fm/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
