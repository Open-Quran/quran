import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

class SearchVerseCard extends StatelessWidget {
  /// [SurahModel]
  final VerseModel verseModel;

  /// Function onTap
  final Function() onTap;

  const SearchVerseCard(
      {Key? key, required this.verseModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: kPaddingL),
        padding: const EdgeInsets.all(kPaddingL),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPaddingM),
            color: AppColors.black2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verseSurahNameTranslated(context),
                verseNumber(context),
                verseSurahNameArabic(context),
              ],
            ),
            const SizedBox(
              height: kPaddingS,
            ),
            Row(
              children: [
                Visibility(child: Expanded(child: verseText(context))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Verse text in english
  Widget verseText(BuildContext context) {
    return Text(
      verseModel.text ?? "",
      textDirection: TextDirection.rtl,

      ///overflow: TextOverflow.ellipsis,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }

  /// Verse surah name in Arabic
  Widget verseSurahNameArabic(BuildContext context) {
    return Text(
      verseModel.surahNameArabic ?? "",
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }

  /// Verse surah name in english
  Widget verseSurahNameTranslated(BuildContext context) {
    return Text(
      "${context.translate.surah} ${verseModel.surahNameTranslated ?? ""}",
      overflow: TextOverflow.ellipsis,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }

  /// Verse number
  Widget verseNumber(BuildContext context) {
    return Text(
      "${context.translate.ayat} ${verseModel.verseNumber ?? ""}",
      overflow: TextOverflow.ellipsis,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }
}
