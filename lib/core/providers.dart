import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'viewmodels/viewmodels.dart';

final homeVM = ChangeNotifierProvider((_) => HomeVM(_.read));
final loaderVM = StateNotifierProvider((_) => LoaderVM(_.read));
final splashVM = StateNotifierProvider((_) => SplashVM(_.read));
final themeVM = StateNotifierProvider((_) => ThemeVM(_.read));
