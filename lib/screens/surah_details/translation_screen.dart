import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:fabrikod_quran/widgets/cards/new_verse_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verses =
        context.watch<SurahDetailsProvider>().versesOfReadingTypeTranslation;
    return InkWell(
      onTap: context.read<SurahDetailsProvider>().changeReadingMode,
      child: ScrollablePositionedList.separated(
        itemCount: verses.length,
        itemScrollController:
            context.read<SurahDetailsProvider>().itemScrollController,
        itemPositionsListener:
            context.read<SurahDetailsProvider>().itemPositionsListener,
        padding: const EdgeInsets.only(
          left: kPaddingM,
          right: kPaddingL,
          bottom: kPaddingXL,
        ),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final verse = verses[index];
          return Column(
            children: [
              BasmalaTitle(verseKey: verse.verseKey ?? ""),
              VerseCard(
                verseModel: verse,
                isPlaying: index == 1,
                arabicFontFamily: Fonts.uthmanic,
                verseTranslations: context
                    .watch<QuranProvider>()
                    .translationService
                    .translationsOfVerse(verse.id!),
                readOptions:
                    context.watch<QuranProvider>().localSetting.readOptions,
                textScaleFactor:
                    context.watch<QuranProvider>().localSetting.textScaleFactor,
                translationFontFamily: Fonts.getTranslationFont(
                    context.watch<QuranProvider>().localSetting.fontType),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: kPaddingM),
      ),
    );
  }
}
