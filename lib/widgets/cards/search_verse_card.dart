import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../models/verse_model.dart';

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
        margin: const EdgeInsets.only(top: kSizeL),
        padding: const EdgeInsets.all(kSizeL),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSizeM),
            color: AppColors.black2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    verseSurahNameTranslated(context),
                    verseNumber(context),
                  ],
                ),
                verseSurahNameArabic(context),
              ],
            ),
            Divider(
              thickness: 1,
              height: kSize3XL,
              color: context.theme.cardTheme.color,
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
      style: context.theme.textTheme.headlineMedium!.copyWith(height: 2),
    );
  }

  /// Verse surah name in Arabic
  Widget verseSurahNameArabic(BuildContext context) {
    return Text(
      verseModel.surahNameArabic ?? "",
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      style:
          context.theme.textTheme.titleLarge!.copyWith(color: AppColors.white5),
    );
  }

  /// Verse surah name in english
  Widget verseSurahNameTranslated(BuildContext context) {
    return Text(
      "${verseModel.surahNameTranslated},  " ?? "",
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.titleMedium!
          .copyWith(color: AppColors.white5),
    );
  }

  /// Verse number
  Widget verseNumber(BuildContext context) {
    return Text(
      "${context.translate.ayat} ${verseModel.verseNumber ?? ""}",
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.titleMedium!
          .copyWith(color: AppColors.white5),
    );
  }
}
