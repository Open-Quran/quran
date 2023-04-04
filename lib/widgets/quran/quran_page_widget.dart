import 'package:dartarabic/dartarabic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../models/mushaf_backgrund_model.dart';
import '../../models/surah_model.dart';
import '../../models/verse_model.dart';
import '../../providers/quran_provider.dart';
import '../basmala_title.dart';

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({
    Key? key,
    required this.versesOfPage,
    this.onTap,
    this.textScaleFactor = 1.0,
    required this.fontTypeArabic,
    required this.layoutOptions,
    required this.surahDetailsPageTheme,
  }) : super(key: key);

  final List<SurahModel> versesOfPage;
  final Function()? onTap;
  final double textScaleFactor;
  final String fontTypeArabic;
  final ELayoutOptions layoutOptions;
  final SurahDetailsPageThemeModel surahDetailsPageTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          buildSurahCard(),
          const SizedBox(height: kSize3XL),
          buildBottomBorder(context, versesOfPage.last.verses.last)
        ],
      ),
    );
  }

  Widget buildSurahCard() {
    return ListView.builder(
      itemCount: versesOfPage.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final verses = versesOfPage.elementAt(index).verses;
        return Column(
          children: [
            BasmalaTitle(verseKey: verses.first.verseKey ?? ""),
            buildVersesText(context, verses, textScaleFactor, layoutOptions,
                fontTypeArabic),
          ],
        );
      },
    );
  }

  Widget buildVersesText(
    BuildContext context,
    List<VerseModel> verses,
    double textScaleFactor,
    ELayoutOptions layoutOptions,
    String fontTypeArabic,
  ) {
    return RichText(
      textDirection: TextDirection.rtl,
      textAlign: layoutOptions == ELayoutOptions.justify
          ? TextAlign.justify
          : TextAlign.right,
      textScaleFactor: textScaleFactor,
      text: TextSpan(
        style: context.theme.textTheme.headlineLarge?.copyWith(
            height: 1.7,
            fontSize: 20,
            fontFamily: Fonts.getArabicFont(fontTypeArabic),
            color: context
                .watch<QuranProvider>()
                .surahDetailsPageThemeColor
                .textColor),
        children: verses
            .map(
              (e) => TextSpan(
                children: [
                  TextSpan(
                      text: e.text! /*DartArabic.normalizeAlef(e.text!)*/,
                      style: TextStyle(letterSpacing: -0.7)),
                  TextSpan(
                    text: Utils.getArabicVerseNo(e.verseNumber.toString()),
                    style: context.theme.textTheme.headlineLarge?.copyWith(
                      fontFamily: Fonts.uthmanicIcon,
                      fontSize: 16,
                      letterSpacing: -2.5,
                      height: 1.2,
                      color: context
                          .watch<QuranProvider>()
                          .surahDetailsPageThemeColor
                          .textColor,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildBottomBorder(BuildContext context, VerseModel verse) {
    return Container(
      padding: const EdgeInsets.only(bottom: kSizeS),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: surahDetailsPageTheme.transparentVectorColor),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${context.translate.juz} ${verse.juzNumber} | ${context.translate.hizb} ${verse.hizbNumber} - ${context.translate.page} ${verse.pageNumber}",
            style: context.theme.textTheme.bodySmall?.copyWith(
                color: surahDetailsPageTheme.transparentTextColor,
                letterSpacing: 0.15),
          ),
          Text(
            verse.pageNumber?.quranPageNumber ?? "",
            style: context.theme.textTheme.bodyMedium?.copyWith(
                color: surahDetailsPageTheme.transparentVectorColor,
                letterSpacing: 0.04),
          ),
        ],
      ),
    );
  }
}
