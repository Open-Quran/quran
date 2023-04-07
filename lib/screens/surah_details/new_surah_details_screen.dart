import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/new_surah_details_provider.dart';
import '../../providers/player_provider.dart';
import '../../providers/quran_provider.dart';
import '../../widgets/animation/fade_indexed_stack.dart';
import '../../widgets/app_bars/secondary_app_bar.dart';
import '../../widgets/bars/play_bar.dart';
import '../../widgets/buttons/translation_reading_segmented_button.dart';
import 'new_reading_screen.dart';
import 'new_translation_screen.dart';

class NewSurahDetailsScreen extends StatefulWidget {
  const NewSurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewSurahDetailsScreen> createState() => _NewSurahDetailsScreenState();
}

class _NewSurahDetailsScreenState extends State<NewSurahDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.watch<NewSurahDetailsProvider>().readingSettings.isReadingMode
          ? const PreferredSize(preferredSize: Size.zero, child: SizedBox())
          : buildAppBar(),
      body: buildBody,
      backgroundColor: context.watch<QuranProvider>().surahDetailsPageThemeColor.backgroundColor,
    );
  }

  /// Custom appBar
  PreferredSizeWidget buildAppBar() => SecondaryAppBar(
        title: context.watch<NewSurahDetailsProvider>().appBarTitle,
        subTitle: context.watch<NewSurahDetailsProvider>().appBarDescription,
        isActiveSoundIcon: context.watch<PlayerProvider>().player.playing,
        onTapSound: context.read<NewSurahDetailsProvider>().onTapSoundIcon,
        isBookmarked: false,
        onTapBookmark: context.read<NewSurahDetailsProvider>().onTapAppBarBookmarkIcon,
      );

  ///Build body
  Widget get buildBody {
    return Padding(
      padding: EdgeInsets.only(
          top: context.watch<NewSurahDetailsProvider>().readingSettings.isReadingMode && Platform.isIOS ? 40 : 0),
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
      visible: !context.watch<NewSurahDetailsProvider>().readingSettings.isReadingMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSizeXXL, horizontal: kSizeXL),
        child: TranslationReadingSegmentedButton(
          initialIndex: context.watch<QuranProvider>().localSetting.quranType.index,
          onValueChanged: context.read<NewSurahDetailsProvider>().changeQuranType,
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
        NewTranslationScreen(),
        NewReadingScreen(),
      ],
    );
  }
}
