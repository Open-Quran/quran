import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/mushaf_backgrund_model.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/bookmark_model.dart';
import '../../providers/bookmark_provider.dart';
import '../../providers/favorites_provider.dart';
import '../../providers/player_provider.dart';
import '../../providers/surah_details_provider.dart';
import '../cards/verse_menu_item.dart';

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
    return Column(
      children: [
        buildSurahCard(),
        const SizedBox(height: kSize3XL),
        buildBottomBorder(context, versesOfPage.last.verses.last)
      ],
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
    var globalKey = GlobalKey();
    return RichText(
      key: globalKey,
      textDirection: TextDirection.rtl,
      textAlign: layoutOptions == ELayoutOptions.justify ? TextAlign.justify : TextAlign.right,
      textScaleFactor: textScaleFactor,
      text: TextSpan(
        style: context.theme.textTheme.headlineLarge?.copyWith(
            height: 2.4,
            fontFamily: Fonts.getArabicFont(fontTypeArabic),
            color: context.watch<QuranProvider>().surahDetailsPageThemeColor.textColor),
        children: verses
            .map((e) {
              return [
                // WidgetSpan(
                //   style: context.theme.textTheme.headlineLarge?.copyWith(
                //       height: 2.4,
                //       fontFamily: Fonts.getArabicFont(fontTypeArabic),
                //       color: context.watch<QuranProvider>().surahDetailsPageThemeColor.textColor),
                //   child: VersePopUpMenu(
                //     globalKey: globalKey,
                //     verseModel: e,
                //     isPlaying: context.watch<PlayerProvider>().isPlayingVerse(e.verseKey ?? ""),
                //     playFunction: (verse, isPlaying) {
                //       context.read<SurahDetailsProvider>().onTapVerseCardPlayOrPause(
                //             e.verseNumber! - 1,
                //             isPlaying,
                //           );
                //     },
                //     isFavorite: context.watch<FavoritesProvider>().isFavoriteVerse(e),
                //     favoriteFunction: context.read<FavoritesProvider>().onTapFavoriteButton,
                //     isBookmark: context.watch<BookmarkProvider>().isBookmark(
                //           BookMarkModel(bookmarkType: EBookMarkType.verse, verseModel: e),
                //         ),
                //     bookmarkFunction: context.read<BookmarkProvider>().onTapBookMarkButton,
                //     shareFunction: (verseModel) {
                //       context.read<SurahDetailsProvider>().shareVerse(verseModel, e.verseNumber!);
                //     },
                //     changeSelectedVerseKey: context.read<SurahDetailsProvider>().changeSelectedVerseKey,
                //     child: Text(
                //       e.text!,
                //       textDirection: TextDirection.rtl,
                //       style: context.theme.textTheme.headlineLarge?.copyWith(
                //           height: 2.4,
                //           fontFamily: Fonts.getArabicFont(fontTypeArabic),
                //           color: context.watch<QuranProvider>().surahDetailsPageThemeColor.textColor),
                //     ),
                //   ),
                // ),
                TextSpan(
                  text: e.text!,
                  style: context.theme.textTheme.headlineLarge?.copyWith(
                    fontFamily: Fonts.uthmanic,
                    fontSize: 27,
                    height: 0,
                    color: context.watch<QuranProvider>().surahDetailsPageThemeColor.textColor,
                  ),
                  recognizer: LongPressGestureRecognizer()
                    ..onLongPress = () async {
                      context.read<SurahDetailsProvider>().changeSelectedVerseKey(e.verseKey);
                      RenderBox box = context.findRenderObject() as RenderBox;
                      Offset position = box.localToGlobal(Offset.zero);
                      await showMenu(
                        context: context,
                        color: context.theme.cardColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        position: RelativeRect.fromRect(
                          Rect.fromLTWH(
                              position.dx + kSizeM, position.dy + (box.paintBounds.size.height - 200 - kSizeM), 0, 0),
                          Rect.fromLTWH(0, 0, box.paintBounds.size.width, box.paintBounds.size.height),
                        ),
                        items: [
                          PopupMenuItem(
                            onTap: () => (verse, isPlaying) {
                              context.read<SurahDetailsProvider>().onTapVerseCardPlayOrPause(
                                    e.verseNumber! - 1,
                                    isPlaying,
                                  );
                            },
                            child: VerseMenuItem(
                              iconPath: context.read<PlayerProvider>().isPlayingVerse(e.verseKey ?? "")
                                  ? ImageConstants.pauseIcon
                                  : ImageConstants.play,
                              buttonName: context.read<PlayerProvider>().isPlayingVerse(e.verseKey ?? "")
                                  ? context.translate.pause
                                  : context.translate.play,
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () => context.read<FavoritesProvider>().onTapFavoriteButton,
                            child: VerseMenuItem(
                              iconPath: context.read<FavoritesProvider>().isFavoriteVerse(e)
                                  ? ImageConstants.favoriteActiveIcon
                                  : ImageConstants.favoriteInactiveIcon,
                              buttonName: context.translate.favorite,
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () => context.read<BookmarkProvider>().onTapBookMarkButton,
                            child: VerseMenuItem(
                              iconPath: context.read<BookmarkProvider>().isBookmark(
                                        BookMarkModel(bookmarkType: EBookMarkType.verse, verseModel: e),
                                      )
                                  ? ImageConstants.bookmarkActiveIcon
                                  : ImageConstants.bookmarkInactiveIcon,
                              buttonName: context.translate.bookmark,
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () => (verseModel) {
                              context.read<SurahDetailsProvider>().shareVerse(verseModel, e.verseNumber!);
                            },
                            child: VerseMenuItem(
                              iconPath: ImageConstants.shareAppIcon,
                              buttonName: context.translate.share,
                            ),
                          ),
                        ],
                      );
                      context.read<SurahDetailsProvider>().changeSelectedVerseKey(null);
                    },
                ),
                TextSpan(
                  text: Utils.getArabicVerseNo(e.verseNumber.toString()),
                  style: context.theme.textTheme.headlineLarge?.copyWith(
                    fontFamily: Fonts.uthmanic,
                    fontSize: 27,
                    height: 0,
                    color: context.watch<QuranProvider>().surahDetailsPageThemeColor.textColor,
                  ),
                ),
              ];
            })
            .expand((i) => i)
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
            style: context.theme.textTheme.bodySmall
                ?.copyWith(color: surahDetailsPageTheme.transparentTextColor, letterSpacing: 0.15),
          ),
          Text(
            verse.pageNumber?.quranPageNumber ?? "",
            style: context.theme.textTheme.bodyMedium
                ?.copyWith(color: surahDetailsPageTheme.transparentVectorColor, letterSpacing: 0.04),
          ),
        ],
      ),
    );
  }
}
