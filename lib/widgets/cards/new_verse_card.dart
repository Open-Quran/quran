import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pop_up/verse_pop_up_menu.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({
    Key? key,
    required this.verseModel,
    required this.verseTranslations,
    required this.arabicFontFamily,
    required this.translationFontFamily,
    required this.textScaleFactor,
    required this.playFunction,
    required this.favoriteFunction,
    required this.bookmarkFunction,
    required this.shareFunction,
    this.isPlaying = false,
    this.isFavorite = false,
    this.isBookmark = false,
    required this.readOptions,
  }) : super(key: key);

  final VerseModel verseModel;
  final EReadOptions readOptions;
  final List<VerseTranslation> verseTranslations;
  final String? arabicFontFamily;
  final String? translationFontFamily;
  final double textScaleFactor;
  final bool isPlaying;
  final bool isFavorite;
  final bool isBookmark;
  final Function(VerseModel verseModel, bool isPlaying) playFunction;
  final Function(VerseModel verseModel, bool isFavorite) favoriteFunction;
  final Function(
          EBookMarkType bookMarkType, VerseModel verseModel, bool isBookmark)
      bookmarkFunction;
  final Function(VerseModel) shareFunction;

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    return VersePopUpMenu(
      globalKey: globalKey,
      verseModel: verseModel,
      isPlaying: isPlaying,
      playFunction: playFunction,
      isFavorite: isFavorite,
      favoriteFunction: favoriteFunction,
      isBookmark: isBookmark,
      bookmarkFunction: bookmarkFunction,
      shareFunction: shareFunction,
      child: Container(
        key: globalKey,
        decoration: isPlaying
            ? BoxDecoration(
                color: AppColors.black9.withOpacity(0.26),
                borderRadius: BorderRadius.circular(kSizeM),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              )
            : const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.grey10,
                    width: 1,
                  ),
                ),
              ),
        padding: const EdgeInsets.all(kSizeS),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerseNumberArabicWithSymbol(
              verseNumber: verseModel.verseNumber.toString(),
              textScaleFactor: textScaleFactor,
              arabicFontFamily: arabicFontFamily,
            ),
            Expanded(
              child: Column(
                children: [
                  buildVerseCardArabic(readOptions, context),
                  buildVerseCardTranslation(readOptions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVerseCardArabic(EReadOptions readOptions, BuildContext context) {
    return Visibility(
      visible: readOptions != EReadOptions.surah,
      child: Column(
        children: [
          VerseCardArabic(
            verse: verseModel.text ?? "",
            textScaleFactor: textScaleFactor,
            isPlaying: isPlaying,
          ),
          buildVerseCardDivider(context),
        ],
      ),
    );
  }

  Widget buildVerseCardTranslation(EReadOptions readOptions) {
    return Visibility(
      visible: readOptions != EReadOptions.translation,
      child: VerseCardTranslation(
        verseTranslations: verseTranslations,
        textScaleFactor: textScaleFactor,
        translationFontFamily: translationFontFamily,
      ),
    );
  }
}

//Arabic Verse number with symbol
class VerseNumberArabicWithSymbol extends StatelessWidget {
  const VerseNumberArabicWithSymbol({
    Key? key,
    required this.verseNumber,
    required this.arabicFontFamily,
    required this.textScaleFactor,
  }) : super(key: key);

  final String verseNumber;
  final String? arabicFontFamily;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Text(
      Utils.getArabicVerseNo(verseNumber),
      textAlign: TextAlign.start,
      textScaleFactor: textScaleFactor,
      style: context.theme.textTheme.displayLarge?.copyWith(
        color: context.watch<QuranProvider>().mushafColor.textColor,
        fontSize: 27,
        fontFamily: arabicFontFamily,
      ),
    );
  }
}

//Arabic Verse and its number
class VerseCardArabic extends StatelessWidget {
  const VerseCardArabic({
    Key? key,
    required this.verse,
    this.isPlaying = false,
    required this.textScaleFactor,
  }) : super(key: key);

  final String verse;
  final bool isPlaying;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: isPlaying
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black10.withOpacity(0),
                  AppColors.brandy.withOpacity(0.24),
                ],
              ),
              borderRadius: BorderRadius.circular(kSizeM),
            )
          : null,
      padding: const EdgeInsets.all(kSizeM),
      child: Text(
        verse,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        textScaleFactor: textScaleFactor,
        style: context.theme.textTheme.displayLarge?.copyWith(
          color: context.watch<QuranProvider>().mushafColor.textColor,
          fontSize: 27,
        ),
      ),
    );
  }
}

/// Divider Line between arabic verse and its translation
Widget buildVerseCardDivider(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 1,
    margin: const EdgeInsets.symmetric(vertical: kSizeM),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          context.watch<QuranProvider>().mushafColor.transparentTextColor,
          context.watch<QuranProvider>().mushafColor.textColor,
        ],
      ),
    ),
  );
}

//Text of translation verse
class VerseCardTranslation extends StatelessWidget {
  const VerseCardTranslation({
    Key? key,
    required this.verseTranslations,
    required this.textScaleFactor,
    required this.translationFontFamily,
  }) : super(key: key);

  final List<VerseTranslation> verseTranslations;
  final double textScaleFactor;
  final String? translationFontFamily;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: verseTranslations.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: kSizeM),
      separatorBuilder: (context, index) => buildVerseCardDivider(context),
      itemBuilder: (context, index) {
        final verseTranslation = verseTranslations[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              verseTranslation.text ?? "",
              textAlign: TextAlign.end,
              textScaleFactor: textScaleFactor,
              style: context.theme.textTheme.titleSmall?.copyWith(
                fontFamily: translationFontFamily,
                color: context.watch<QuranProvider>().mushafColor.textColor,
              ),
            ),
            const SizedBox(height: kSizeM),
            Text(
              "- ${verseTranslation.translationName}",
              textAlign: TextAlign.end,
              textScaleFactor: textScaleFactor,
              style: context.theme.textTheme.labelLarge?.copyWith(
                fontFamily: translationFontFamily,
                color: context
                    .watch<QuranProvider>()
                    .mushafColor
                    .transparentTextColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
