import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/mushaf_screen.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:fabrikod_quran/widgets/bottom_sheets/quran_style_bottom_sheets.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/verse_card.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomDrawerScaffold(
      appBarTitle: context.watch<SurahDetailsProvider>().appBarTitle,
      drawer: const CustomDrawer(),
      onTapMore: () {
        QuranStyleBottomSheet.show(context);
      },
      body: buildBody,
    );
  }

  Widget get buildBody {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kPaddingVertical,
        horizontal: kPaddingHorizontal,
      ),
      child: Column(
        children: [
          buildTranslationOrReadingSwitch,
          const SizedBox(height: kPaddingHorizontal),
          Expanded(child: buildTranslationOrReading),
        ],
      ),
    );
  }

  /// Switch [translation] or [reading]
  Widget get buildTranslationOrReadingSwitch {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.translation,
        context.translate.reading,
      ],
      selectedIndex: context
          .watch<SurahDetailsProvider>()
          .readingSettings
          .readingType
          .index,
      onTap: context.read<SurahDetailsProvider>().changeReadingType,
    );
  }

  Widget get buildTranslationOrReading {
    switch (context.watch<SurahDetailsProvider>().readingSettings.readingType) {
      case EReadingType.translation:
        return buildVerseList;
      case EReadingType.reading:
        return buildMushaf;
    }
  }

  /// Listing Verses
  Widget get buildVerseList {
    var verses =
        context.watch<SurahDetailsProvider>().versesOfReadingTypeTranslation;

    return ListView.separated(
      itemCount: verses.length,
      itemBuilder: (context, index) => Column(
        children: [
          BasmalaTitle(
            verseKey: verses[index].verseKey ?? "",
            isName: context
                    .read<SurahDetailsProvider>()
                    .readingSettings
                    .surahDetailScreenMod ==
                ESurahDetailScreenMod.juz,
          ),
          VerseCard(verseModel: verses[index]),
        ],
      ),
      separatorBuilder: (context, index) =>
          const SizedBox(height: kPaddingContentSpaceBetween),
    );
  }

  Widget get buildMushaf {
    var surahs = context.watch<SurahDetailsProvider>().surahsOfMushafPage;
    return MushafScreen(surahs: surahs);
  }
}
