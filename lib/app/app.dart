import 'package:fountain_fm/app/router.dart';
import 'package:fountain_fm/core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fountain_fm/l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: ProviderScopeApp(),
    );
  }
}

class ProviderScopeApp extends HookConsumerWidget {
  const ProviderScopeApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeVM.notifier)

      /// Force potrait mode on Android & iOS.
      ..handlePortraitMode();

    return AnnotatedRegion(
      value: theme.style,
      child: MaterialApp.router(
        routeInformationParser: FountainRouter.router.routeInformationParser,
        routerDelegate: FountainRouter.router.routerDelegate,
        title: 'Fountain Garden',
       // navigatorKey: navigator.key,
        debugShowCheckedModeBanner: false,
        theme: theme.themeData,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
       
      ),
    );
  }
}
