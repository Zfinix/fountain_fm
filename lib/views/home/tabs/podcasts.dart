import 'package:flutter/material.dart';
import 'package:fountain_fm/core/providers.dart';
import 'package:fountain_fm/utils/colors.dart';
import 'package:fountain_fm/utils/extensions/global_extensions.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:fountain_fm/widgets/crb.dart' as crb;

class PodcastsPage extends StatefulHookConsumerWidget {
  const PodcastsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PodcastsPage> createState() => _PodcastsPageState();
}

class _PodcastsPageState extends ConsumerState<PodcastsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeVM).loadPodcastModel();
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(homeVM).appBarColor;

    final podcast = ref.watch(
      homeVM.select(
        (v) => v.podcastModel.show,
      ),
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          backgroundColor: color,
          expandedHeight: context.screenHeight(0.36),
          collapsedHeight: context.screenHeight(0.26),
          leading: IconButton(
            icon: const Icon(LineIcons.lightningBolt),
            onPressed: () {},
          ),
          shape: const crb.ContinuousRectangleBorder(
            cornerRadius: 30,
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 90,
                width: 90,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      podcast.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: crb.ContinuousRectangleBorder(
                    cornerRadius: 60,
                    borderSide:
                        BorderSide(color: white.withOpacity(0.3), width: 2),
                  ),
                ),
              ),
              const Gap(16),
              FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                titlePadding: const EdgeInsets.only(top: 4),
                title: Text(
                  podcast.title,
                  style: GoogleFonts.dmSans(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(8),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    podcast.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      color: white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(LineIcons.link),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(LineIcons.userAlt),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(LineIcons.alternateShare),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Text(
                podcast.publisher,
                style: GoogleFonts.dmSans(
                  color: white.withOpacity(.5),
                  fontSize: 10,
                ),
              ),
              const Gap(20),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(LineIcons.verticalEllipsis),
              tooltip: 'Add new entry',
              onPressed: () {/* ... */},
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[],
          ),
        ),
      ],
    );
  }
}
