import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

import '../show_menus/custom_gesture_detector.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({
    Key? key,
    required this.verseModel,
    required this.verseTranslations,
    required this.arabicFontFamily,
    required this.translationFontFamily,
    required this.textScaleFactor,
    this.isPlaying = false,
    required this.readOptions,
  }) : super(key: key);

  final VerseModel verseModel;
  final EReadOptions readOptions;
  final List<VerseTranslation> verseTranslations;
  final String? arabicFontFamily;
  final String? translationFontFamily;
  final double textScaleFactor;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    return CustomGestureDetector(
      verseModel: verseModel,
      globalKey: globalKey,
      child: Container(
        key: globalKey,
        decoration: isPlaying
            ? BoxDecoration(
                color: AppColors.black9.withOpacity(0.26),
                borderRadius: BorderRadius.circular(kPaddingM),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4)
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
        padding: const EdgeInsets.all(kPaddingS),
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
                  buildVerseCardArabic(readOptions),
                  buildVerseCardTranslation(readOptions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVerseCardArabic(EReadOptions readOptions) {
    return Visibility(
      visible: readOptions != EReadOptions.surah,
      child: Column(
        children: [
          VerseCardArabic(
            verse: verseModel.text ?? "",
            textScaleFactor: textScaleFactor,
            isPlaying: isPlaying,
          ),
          const VerseCardDividerLine(),
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
        color: AppColors.grey9,
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
              borderRadius: BorderRadius.circular(kPaddingM),
            )
          : null,
      padding: const EdgeInsets.all(kPaddingM),
      child: Text(
        verse,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        textScaleFactor: textScaleFactor,
        style: context.theme.textTheme.displayLarge?.copyWith(
          color: AppColors.grey,
          fontSize: 27,
        ),
      ),
    );
  }
}

// Divider Line between arabic verse and its translation
class VerseCardDividerLine extends StatelessWidget {
  const VerseCardDividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: kPaddingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.black10.withOpacity(0),
            AppColors.grey10.withOpacity(1),
          ],
        ),
      ),
    );
  }
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
      padding: const EdgeInsets.only(bottom: kPaddingM),
      separatorBuilder: (context, index) => const VerseCardDividerLine(),
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
                color: AppColors.grey2,
              ),
            ),
            const SizedBox(height: kPaddingM),
            Text(
              "- ${verseTranslation.translationName}",
              textAlign: TextAlign.end,
              textScaleFactor: textScaleFactor,
              style: context.theme.textTheme.labelLarge?.copyWith(
                fontFamily: translationFontFamily,
                color: AppColors.grey11,
              ),
            ),
          ],
        );
      },
    );
  }
}
