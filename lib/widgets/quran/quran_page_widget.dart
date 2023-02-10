import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:flutter/material.dart';

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({
    Key? key,
    required this.versesOfPage,
    this.onTap,
    this.textScaleFactor = 1.0,
    required this.fontTypeArabic,
    required this.layoutOptions,
  }) : super(key: key);

  final List<SurahModel> versesOfPage;
  final Function()? onTap;
  final double textScaleFactor;
  final String fontTypeArabic;
  final ELayoutOptions layoutOptions;

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
            buildVersesText(context, verses, textScaleFactor, layoutOptions, fontTypeArabic),
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
      textAlign: layoutOptions == ELayoutOptions.center ? TextAlign.center : TextAlign.right,
      textScaleFactor: textScaleFactor,
      text: TextSpan(
        style: context.theme.textTheme.headlineLarge?.copyWith(
          height: 2.4,
          fontFamily: Fonts.getArabicFont(fontTypeArabic),
        ),
        children: verses
            .map(
              (e) => TextSpan(
                children: [
                  TextSpan(text: e.text!),
                  TextSpan(
                    text: Utils.getArabicVerseNo(e.verseNumber.toString()),
                    style: context.theme.textTheme.headlineLarge?.copyWith(
                      fontFamily: Fonts.uthmanic,
                      fontSize: 27,
                      height: 0,
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
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: AppColors.black10),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${context.translate.juz} ${verse.juzNumber} | ${context.translate.hizb} ${verse.hizbNumber} - ${context.translate.page} ${verse.pageNumber}",
            style: context.theme.textTheme.bodySmall
                ?.copyWith(color: AppColors.black11, letterSpacing: 0.15),
          ),
          Text(
            verse.pageNumber?.quranPageNumber ?? "",
            style: context.theme.textTheme.bodyMedium
                ?.copyWith(color: AppColors.black11, letterSpacing: 0.04),
          ),
        ],
      ),
    );
  }
}
