import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/bookmark_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/cards/action_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MushafPage extends StatelessWidget {
  final int pageNo;

  const MushafPage({Key? key, required this.pageNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var surahs = context.read<SurahDetailsProvider>().getSurahOfMushafPage(pageNo);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: context.read<SurahDetailsProvider>().changeReadingMode,
              child: ListView.builder(
                itemCount: surahs.length,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: kPaddingHorizontal),
                itemBuilder: (context, index) {
                  return buildSurah(context, surahs[index]);
                },
              ),
            ),
          ),
          buildButtons(context)
        ],
      ),
    );
  }

  Widget buildSurah(BuildContext context, SurahModel surah) {
    return Column(
      children: [
        BasmalaTitle(verseKey: surah.verses.first.verseKey ?? ""),
        buildActionCard(context, surah.verses.first),
        const SizedBox(height: kPaddingHorizontal),
        buildVersesText(context, surah.verses),
        const SizedBox(height: kPaddingHorizontal),
      ],
    );
  }

  Widget buildActionCard(BuildContext context, VerseModel verseModel) {
    bool isBookmarked = context.watch<BookmarkProvider>().isBookmark(
          BookMarkModel(verseModel: verseModel, bookmarkType: EBookMarkType.page),
        );
    bool isPlaying = context.watch<PlayerProvider>().isPlayingMushaf(
          pageNumber: verseModel.pageNumber,
          surahId: verseModel.surahId,
        );
    return ActionCard(
      isShowMoreButton: false,
      isBookmark: isBookmarked,
      bookmarkButtonOnTap: () => context.read<BookmarkProvider>().bookmarkIconOnTap(
            isBookmarked,
            verseModel,
            EBookMarkType.page,
          ),
      isPlaying: isPlaying,
      playButtonOnTap: (bool isPlaying) =>
          context.read<SurahDetailsProvider>().playTheMushafPage(isPlaying, verseModel.surahId!),
    );
  }

  Widget buildVersesText(BuildContext context, List<VerseModel> verses) {
    return RichText(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
      textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactorArabic,
      text: TextSpan(
        style: context.theme.textTheme.headlineLarge?.copyWith(
          height: 2.5,
          fontFamily:
              Fonts.getArabicFont(context.watch<QuranProvider>().localSetting.fontTypeArabic),
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
                      fontSize: 30,
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

  Widget buildButtons(BuildContext context) {
    //int pageNumber = context.watch<SurahDetailsProvider>().readingSettings.mushafPageNumber;
    return Visibility(
      visible: !context.watch<SurahDetailsProvider>().readingSettings.isReadingMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPaddingVertical),
        child: Row(
          children: [
            Expanded(
              child: Opacity(
                opacity: pageNo > 603 ? 0.2 : 1.0,
                child: CustomButton(
                  title: context.translate.nextPage,
                  height: 55,
                  onTap: pageNo > 603
                      ? null
                      : () {
                          int newPageNo = pageNo + 1;
                          context
                              .read<SurahDetailsProvider>()
                              .changeMushafPageNumberForButton(newPageNo);
                        },
                ),
              ),
            ),
            const SizedBox(width: kPaddingDefault),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: context.theme.toggleButtonsTheme.selectedColor,
                borderRadius: BorderRadius.circular(kPaddingDefault),
              ),
              child: Center(
                child: Text(
                  pageNo.toString(),
                  style: context.theme.toggleButtonsTheme.textStyle!
                      .copyWith(color: context.theme.toggleButtonsTheme.textStyle!.color),
                ),
              ),
            ),
            const SizedBox(width: kPaddingDefault),
            Expanded(
              child: Opacity(
                opacity: pageNo < 2 ? 0.2 : 1.0,
                child: CustomButton(
                  title: context.translate.previousPage,
                  height: 55,
                  onTap: pageNo < 2
                      ? null
                      : () {
                    int newPageNo = pageNo - 1;
                    context
                        .read<SurahDetailsProvider>()
                        .changeMushafPageNumberForButton(newPageNo);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
