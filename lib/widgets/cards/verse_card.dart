import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/bookmark_provider.dart';
import 'package:fabrikod_quran/providers/favorites_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/services/copy_and_share_service.dart';
import 'package:fabrikod_quran/widgets/cards/action_card.dart';
import 'package:fabrikod_quran/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({Key? key, required this.verseModel, this.isFavorite = false}) : super(key: key);

  /// Verse model
  final VerseModel verseModel;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildVerseActionCart(context),
        buildVerse(context),
      ],
    );
  }

  /// The header of the action card
  Widget buildVerseActionCart(BuildContext context) {
    bool isPlaying = context.watch<PlayerProvider>().isPlayingVerse(verseModel.verseKey ?? "");
    bool isFavorite = context.watch<FavoritesProvider>().isFavoriteVerse(verseModel);
    bool isBookmarked = context.watch<BookmarkProvider>().isBookmark(
          BookMarkModel(verseModel: verseModel, bookmarkType: EBookMarkType.verse),
        );
    return ActionCard(
      shareButtonOnTap: () {
        CopyAndShareService.share(
          "${verseModel.text}\n\n${context.read<QuranProvider>().translationService.translationsOfVerse(verseModel.id!).first.text}",
        );
      },
      copyButtonOnTap: () {
        CopyAndShareService.copy(
          context,
          "${verseModel.text}\n\n${context.read<QuranProvider>().translationService.translationsOfVerse(verseModel.id!).first.text} ",
        );
      },
      verseKey: verseModel.verseKey,
      isPlaying: isPlaying,
      playButtonOnTap: (isPlaying) =>
          context.read<SurahDetailsProvider>().playTheVerses(isPlaying, verseModel.verseKey!),
      isFavorite: isFavorite,
      favoriteButtonOnTap: () => isFavorite
          ? context.read<FavoritesProvider>().deleteVerseFromFavorites(verseModel)
          : context.read<FavoritesProvider>().addVerseToFavorite(verseModel),
      isBookmark: isBookmarked,
      bookmarkButtonOnTap: () => context.read<BookmarkProvider>().bookmarkIconOnTap(
            isBookmarked,
            verseModel,
            EBookMarkType.verse,
          ),
    );
  }

  Widget buildVerse(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kPaddingXL),
        buildVerseText(context),
        const SizedBox(height: kPaddingXL),
        buildVerseTranslationText(context),
        Divider(thickness: 1, color: context.theme.dividerColor)
      ],
    );
  }

  /// Verse Text
  Widget buildVerseText(BuildContext context) {
    return Visibility(
      visible: isFavorite ||
          context.watch<QuranProvider>().localSetting.readingType != EReadingType.translation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              verseModel.text ?? "",
              textDirection: TextDirection.rtl,
              textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactorArabic,
              style: context.theme.textTheme.headlineLarge?.copyWith(
                fontSize: 22,
                fontFamily:
                    Fonts.getArabicFont(context.watch<QuranProvider>().localSetting.fontTypeArabic),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Verse Translation Text
  Widget buildVerseTranslationText(BuildContext context) {
    List<VerseTranslation> translationList =
        context.watch<QuranProvider>().translationService.translationsOfVerse(verseModel.id!);
    return Visibility(
      visible: isFavorite ||
          context.watch<QuranProvider>().localSetting.readingType != EReadingType.arabic,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              children: [
                ...translationList.map(
                  (e) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.text ?? "",
                          textScaleFactor:
                              context.watch<QuranProvider>().localSetting.textScaleFactor,
                          style: context.theme.textTheme.titleSmall?.copyWith(
                            fontFamily: Fonts.getTranslationFont(
                                context.watch<QuranProvider>().localSetting.fontType),
                          ),
                        ),
                        CustomSpace.normal(),
                        Text(
                          "- ${context.read<QuranProvider>().translationService.translationsName(e.resourceId!)}",
                          textScaleFactor:
                              context.watch<QuranProvider>().localSetting.textScaleFactor,
                          style: context.theme.textTheme.headlineLarge?.copyWith(
                            fontFamily: Fonts.getTranslationFont(
                                context.watch<QuranProvider>().localSetting.fontType),
                            fontSize: 12,
                          ),
                        ),
                        CustomSpace.big(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
