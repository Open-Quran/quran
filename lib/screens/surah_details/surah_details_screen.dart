import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/search_result_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/reading_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/translation_screen.dart';
import 'package:fabrikod_quran/widgets/animation/fade_indexed_stack.dart';
import 'package:fabrikod_quran/widgets/app_bars/secondary_app_bar.dart';
import 'package:fabrikod_quran/widgets/bars/play_bar.dart';
import 'package:fabrikod_quran/widgets/buttons/translation_reading_segmented_button.dart';
import 'package:fabrikod_quran/widgets/lists/juz_list.dart';
import 'package:fabrikod_quran/widgets/lists/surah_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/buttons/juz_surah_search_toggle_button.dart';
import '../verse_details_settings.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody,
    );
  }

  PreferredSizeWidget buildAppBar() => SecondaryAppBar(
        title: context.watch<SurahDetailsProvider>().appBarTitle,
        subTitle: context.watch<SurahDetailsProvider>().appBarDescription,
        onTapSettings: context.read<SurahDetailsProvider>().changeOpenSetting,
        isDrawerOpen: context.watch<SurahDetailsProvider>().isTitleMenu,
        onTapTitle: context.watch<SurahDetailsProvider>().changeTitleMenuState,
        onTapMenu: context.watch<SurahDetailsProvider>().changeTitleMenuState,
      );

  Widget get buildBody {
    return FadeIndexedStack(
      index: context.watch<SurahDetailsProvider>().isTitleMenu.getNumber,
      children: [
        FadeIndexedStack(
          index: context.watch<SurahDetailsProvider>().isOpenSetting.getNumber,
          children: [
            Column(
              children: [
                buildTranslationOrReadingSwitch,
                Expanded(child: buildTranslationOrReading),
                const PlayBar(padding: EdgeInsets.only(bottom: kSizeXL))
              ],
            ),
            const VerseDetailsSettings(),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              JuzSurahSearchToggleButton(
                toggleSearchButtonIndex: context
                    .read<SearchProvider>()
                    .toggleSearchOptions
                    .index,
                onChanged: context
                    .watch<SurahDetailsProvider>()
                    .changeJuzOrSurahToggleOptionType,
                onTapSearchButton:    context
                    .read<SurahDetailsProvider>()
                    .changeToggleSearchOptions,
                toggleListType: context
                    .watch<SurahDetailsProvider>()
                    .juzSurahToggleOptionType,
              ),
              FadeIndexedStack(
                index: context
                    .watch<SearchProvider>()
                    .toggleSearchOptions
                    .index,
                children: [
                  buildToggleSearchPages(context),
                  const SearchResultScreen(isHome: false),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Switch [translation] or [reading]
  Widget get buildTranslationOrReadingSwitch {
    return Visibility(
      visible:
          !context.watch<SurahDetailsProvider>().readingSettings.isReadingMode,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: kSizeXXL, horizontal: kSizeXL),
        child: TranslationReadingSegmentedButton(
          initialIndex:
              context.watch<QuranProvider>().localSetting.quranType.index,
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

  /// Juz/Translation and Search pages
  FadeIndexedStack buildToggleSearchPages(BuildContext context) {
    return FadeIndexedStack(
      index:
          context.watch<SurahDetailsProvider>().juzSurahToggleOptionType.index,
      children: [
        JuzList(
            changeListType:
                context.read<SurahDetailsProvider>().changeJuzListType,
            juzListType: context.watch<SurahDetailsProvider>().juzListType,
            onTapJuzCard: (juzId) {
              context.read<SearchProvider>().goToJuz(context, juzId, false);
            },
            onTapSurahCard: (surahId) {
              context.read<SearchProvider>().goToSurah(context, surahId, false);
            }),
        SurahList(onTap: (surahId) {
          context.read<SearchProvider>().goToSurah(context, surahId, false);
        }),
      ],
    );
  }
}
