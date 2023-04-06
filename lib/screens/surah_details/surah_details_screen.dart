import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/screens/surah_details/reading_screen.dart';
import 'package:the_open_quran/screens/surah_details/translation_screen.dart';

import '../../providers/player_provider.dart';
import '../../providers/quran_provider.dart';
import '../../providers/surah_details_provider.dart';
import '../../widgets/animation/fade_indexed_stack.dart';
import '../../widgets/app_bars/secondary_app_bar.dart';
import '../../widgets/bars/play_bar.dart';
import '../../widgets/buttons/translation_reading_segmented_button.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.watch<SurahDetailsProvider>().readingSettings.isReadingMode
          ? const PreferredSize(preferredSize: Size.zero, child: SizedBox())
          : buildAppBar(),
      body: buildBody,
      backgroundColor: context.watch<QuranProvider>().surahDetailsPageThemeColor.backgroundColor,
    );
  }

  PreferredSizeWidget buildAppBar() => SecondaryAppBar(
        title: context.watch<SurahDetailsProvider>().appBarTitle,
        subTitle: context.watch<SurahDetailsProvider>().appBarDescription,
        isActiveSoundIcon: context.watch<PlayerProvider>().player.playing,
        onTapSound: context.read<SurahDetailsProvider>().onTapSoundIcon,
        isBookmarked: context.watch<SurahDetailsProvider>().appBarBookmarkActive,
        onTapBookmark: context.read<SurahDetailsProvider>().onTapAppBarBookmarkIcon,
      );

  Widget get buildBody {
    return Padding(
      padding: EdgeInsets.only(
          top: context.watch<SurahDetailsProvider>().readingSettings.isReadingMode && Platform.isIOS ? 40 : 0),
      child: Column(
        children: [
          buildTranslationOrReadingSwitch,
          Expanded(child: buildTranslationOrReading),
          const PlayBar(padding: EdgeInsets.only(bottom: kSizeXL)),
        ],
      ),
    );
  }

  /// Switch [translation] or [reading]
  Widget get buildTranslationOrReadingSwitch {
    return Visibility(
      visible: !context.watch<SurahDetailsProvider>().readingSettings.isReadingMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSizeXXL, horizontal: kSizeXL),
        child: TranslationReadingSegmentedButton(
          initialIndex: context.watch<QuranProvider>().localSetting.quranType.index,
          onValueChanged: context.read<SurahDetailsProvider>().changeQuranType,
        ),
      ),
    );
  }

  /// Switch toggles
  /// [EQuranType.translation] and [EQuranType.reading]
  Widget get buildTranslationOrReading {
    return FadeIndexedStack(
      index: context.watch<QuranProvider>().localSetting.quranType.index,
      children: const [
        TranslationScreen(),
        ReadingScreen(),
      ],
    );
  }
}
