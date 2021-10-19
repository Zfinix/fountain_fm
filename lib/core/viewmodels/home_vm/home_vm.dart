import 'package:fountain_fm/core/fountain_api/fountain_api.dart';
import 'package:fountain_fm/core/fountain_repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:fountain_fm/views/home/tabs/podcasts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fountain_fm/core/providers.dart';
import 'package:fountain_fm/core/viewmodels/viewmodels.dart';

class HomeVM extends ChangeNotifier {
  HomeVM(this.read);

  LoaderVM get loader => read(loaderVM.notifier);

  final Reader read;
  final api = Repository();
  final pageController = PageController();

  List<Color> get appBarColors => [
        Colors.purpleAccent,
        Colors.pinkAccent,
        Colors.green,
      ];

  Color get appBarColor => appBarColors[currentTab];

  final pages = <Widget>[
    const PodcastsPage(
      key: PageStorageKey<String>('ic_home'),
    ),
    const PodcastsPage(
      key: PageStorageKey<String>('ic_home'),
    ),
    const PodcastsPage(
      key: PageStorageKey<String>('ic_home'),
    ),
  ];

  int _currentTab = 1;

  int get currentTab => _currentTab;
  set currentTab(int val) {
    _currentTab = val;
    notifyListeners();
  }

  PodcastModel _podcastModel = PodcastModel.empty;
  PodcastModel get podcastModel => _podcastModel;
  set podcastModel(PodcastModel val) {
    _podcastModel = val;
    notifyListeners();
  }

  void loadTabDataByIndex(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      default:
    }
  }

  Future<void> loadPodcastModel() async {
    final req = await api.getPodcasts();

    req.fold(
      (l) => null,
      (r) {
        podcastModel = r;
      },
    );
    notifyListeners();
  }

  void onPageChanged(int index) {
    currentTab = index;
    loadTabDataByIndex(index);
  }
}
