import 'package:flutter/material.dart';
import 'package:fountain_fm/core/providers.dart';

import 'package:fountain_fm/utils/colors.dart';
import 'package:fountain_fm/utils/extensions/global_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    ref.read(splashVM.notifier).handleLoadSplash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: black,
      child: Center(
        child: SizedBox(
          height: context.screenWidth(.25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'fountain'.png,
            ),
          ),
        ),
      ),
    );
  }
}
