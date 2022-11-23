import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:fabrikod_quran/widgets/cards/verse_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verses = context.watch<SurahDetailsProvider>().versesOfReadingTypeTranslation;
    return InkWell(
      onTap: context.read<SurahDetailsProvider>().changeReadingMode,
      child: ScrollablePositionedList.separated(
        itemCount: verses.length,
        itemScrollController: context.read<SurahDetailsProvider>().itemScrollController,
        itemPositionsListener: context.read<SurahDetailsProvider>().itemPositionsListener,
        padding: const EdgeInsets.only(
          left: kPaddingHorizontal,
          right: kPaddingHorizontal,
          bottom: kPaddingHorizontal,
        ),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            BasmalaTitle(
              verseKey: verses[index].verseKey ?? "",
              isName: context.read<SurahDetailsProvider>().readingSettings.surahDetailScreenMod ==
                  ESurahDetailScreenMod.juz,
            ),
            VerseCard(verseModel: verses[index]),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: kPaddingContentSpaceBetween),
      ),
    );
  }
}
