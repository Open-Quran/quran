import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../models/translation.dart';
import '../../models/verse_model.dart';
import '../../providers/quran_provider.dart';
import '../../providers/surah_details_provider.dart';
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
    required this.selectedVerseKey,
    required this.changeSelectedVerseKey,
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
  final String? selectedVerseKey;
  final Function(String? selectedVerseKey) changeSelectedVerseKey;

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
      changeSelectedVerseKey: changeSelectedVerseKey,
      child: Container(
        key: globalKey,
        decoration: selectedVerseKey == verseModel.verseKey || isPlaying
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
            : BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context
                        .watch<QuranProvider>()
                        .surahDetailsPageThemeColor
                        .titleVectorColor
                        .withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context
                        .read<SurahDetailsProvider>()
                        .changeAyahNumberStyle();
                  },
                  child: _verseNumberText(context),
                ),
                isBookmark
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: kSizeM, top: kSizeM),
                        child: SvgPicture.asset(
                          ImageConstants.bookmarkIconCard,
                          color: context
                              .watch<QuranProvider>()
                              .surahDetailsPageThemeColor
                              .textColor,
                        ),
                      )
                    : Container(),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  _buildVerseCardArabic(readOptions, context),
                  _buildVerseCardTranslation(readOptions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The number of ayat if arabic and latin format
  _verseNumberText(BuildContext context) {
    if (context.read<SurahDetailsProvider>().isLatinNumber) {
      return Text(
        Utils.getArabicVerseNo(verseModel.verseNumber.toString()),
        textAlign: TextAlign.start,
        textScaleFactor: textScaleFactor,
        style: context.theme.textTheme.displayLarge?.copyWith(
          color: context
              .watch<QuranProvider>()
              .surahDetailsPageThemeColor
              .textColor,
          fontSize: 30,
          fontFamily: arabicFontFamily,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: kSizeXXL, left: kSizeM),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              verseModel.verseNumber.toString(),
              textAlign: TextAlign.start,
              textScaleFactor: textScaleFactor,
              style: context.theme.textTheme.displayLarge?.copyWith(
                color: context
                    .watch<QuranProvider>()
                    .surahDetailsPageThemeColor
                    .textColor,
                fontSize: 15,
                fontFamily: arabicFontFamily,
              ),
            ),
            SvgPicture.asset(
              ImageConstants.versNumberFrame,
              height: 32,
              color: context
                  .watch<QuranProvider>()
                  .surahDetailsPageThemeColor
                  .textColor
                  .withOpacity(0.6),
            ),
          ],
        ),
      );
    }
  }

  /// Arabic Text
  Widget _buildVerseCardArabic(EReadOptions readOptions, BuildContext context) {
    return Visibility(
      visible: readOptions != EReadOptions.translation,
      child: Column(
        children: [
          Container(
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
            child: RichText(
              text: TextSpan(
                text: verseModel.text!,
                style: context.theme.textTheme.headlineLarge?.copyWith(
                    height: 1.7,
                    fontSize: 20,
                    fontFamily: context.watch<QuranProvider>().localSetting.fontTypeArabic,
                    color: context
                        .watch<QuranProvider>()
                        .surahDetailsPageThemeColor
                        .textColor),
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
              textScaleFactor: textScaleFactor,
              /* style: context.theme.textTheme.displayLarge?.copyWith(
                color: context.watch<QuranProvider>().surahDetailsPageThemeColor.textColor,
                fontSize: 27,
                fontFamily: context.watch<QuranProvider>().localSetting.fontTypeArabic,
              ), */
            ),
          ),
          Visibility(
              visible: readOptions == EReadOptions.surahAndTranslation,
              child: buildVerseCardDivider(context)),
        ],
      ),
    );
  }

  /// Translation Text
  Widget _buildVerseCardTranslation(EReadOptions readOptions) {
    return Visibility(
      visible: readOptions != EReadOptions.surah,
      child: Padding(
        padding: readOptions == EReadOptions.translation
            ? const EdgeInsets.only(top: kSizeXL)
            : EdgeInsets.zero,
        child: ListView.separated(
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
                    color: context
                        .watch<QuranProvider>()
                        .surahDetailsPageThemeColor
                        .textColor,
                  ),
                ),
                Text(
                  "- ${verseTranslation.translationName}",
                  textAlign: TextAlign.end,
                  textScaleFactor: textScaleFactor,
                  style: context.theme.textTheme.labelLarge?.copyWith(
                    fontFamily: translationFontFamily,
                    color: context
                        .watch<QuranProvider>()
                        .surahDetailsPageThemeColor
                        .transparentTextColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Divider Line between arabic verse and its translation
  Widget buildVerseCardDivider(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: kSizeS),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context
                .watch<QuranProvider>()
                .surahDetailsPageThemeColor
                .transparentVectorColor
                .withOpacity(0),
            context
                .watch<QuranProvider>()
                .surahDetailsPageThemeColor
                .textColor
                .withOpacity(0.24),
          ],
        ),
      ),
    );
  }
}
