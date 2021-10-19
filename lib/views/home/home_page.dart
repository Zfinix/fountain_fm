import 'package:fountain_fm/core/providers.dart';
import 'package:fountain_fm/utils/extensions/global_extensions.dart';
import 'package:fountain_fm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with WidgetsBindingObserver {
  final _bucket = PageStorageBucket();

  @override
  void initState() {
    () {
      ref.read(themeVM.notifier).systemNavigationBarColor = white;
      //HomeVM.instance.loadAppData();
    }.withPostFrameCallback();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeVM);
    final currentTab = ref.watch(homeVM.select((v) => v.currentTab));

    return Scaffold(
      backgroundColor: black,
      body: PageStorage(
        bucket: _bucket,
        child: PageView(
          controller: provider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: provider.pages,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40).add(
          const EdgeInsets.only(bottom: 15),
        ),
        child: SalomonBottomBar(
          currentIndex: currentTab,
          onTap: (_) {
            ref.read(homeVM.notifier).onPageChanged(_);
        
          },
          unselectedItemColor: Colors.white,
          selectedItemColor: white,
          items: [
            /// Home
            SalomonBottomBarItem(
              title: const Text('Clips'),
              icon: const Icon(LineIcons.cut),
              selectedColor: Colors.purpleAccent,
            ),

            /// Likes
            SalomonBottomBarItem(
              title: const Text('Podcasts'),
              icon:  const Icon(LineIcons.podcast),
              selectedColor: Colors.pinkAccent,
            ),

            /// Search
            SalomonBottomBarItem(
              title: const Text('Profile'),
              icon: const Icon(LineIcons.user),
              selectedColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
