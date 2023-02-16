import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/reading_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/translation_screen.dart';
import 'package:fabrikod_quran/widgets/animation/fade_indexed_stack.dart';
import 'package:fabrikod_quran/widgets/app_bars/secondary_app_bar.dart';
import 'package:fabrikod_quran/widgets/bars/play_bar.dart';
import 'package:fabrikod_quran/widgets/buttons/translation_reading_segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/cards/surah_card.dart';
import '../verse_details_settings.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SurahDetailsProvider>().initAfterScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody,
      backgroundColor:
          context.watch<QuranProvider>().mushafColor.backgroundColor,
    );
  }

  PreferredSizeWidget buildAppBar() => SecondaryAppBar(
        title: context.watch<SurahDetailsProvider>().appBarTitle,
        subTitle: 'Juz 1 | Hizb 1 - Page 1',
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
        buildSurahList(),
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

  /// List of the Surah Verses
  Widget buildSurahList() {
    var surahs = context.watch<QuranProvider>().surahs;
    return ListView.separated(
      itemCount: surahs.length,
      padding: const EdgeInsets.all(kSizeL),
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return SurahCard(
          surahModel: surah,
          onTap: () {
            context.read<SurahDetailsProvider>().readingSettings.surahIndex =
                surah.id! - 1;
            context.read<SurahDetailsProvider>().changeTitleMenuState();
            print("On Tap Surah Card : ${surah.id}");
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }
}
