import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/bookmark_provider.dart';
import 'package:fabrikod_quran/providers/favorites_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/services/copy_and_share_service.dart';
import 'package:fabrikod_quran/widgets/cards/action_card.dart';
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
          "${verseModel.text}\n\n${context.read<QuranProvider>().verseTranslation?.translations?.elementAt(verseModel.id! - 1).text}",
        );
      },
      copyButtonOnTap: () {
        CopyAndShareService.copy(
          context,
          "${verseModel.text}\n\n${context.read<QuranProvider>().verseTranslation?.translations?.elementAt(verseModel.id! - 1).text} ",
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        buildVerseText(context),
        const SizedBox(height: 20),
        buildVerseTranslationText(context),
        const SizedBox(height: 15),
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
    return Visibility(
      visible: isFavorite ||
          context.watch<QuranProvider>().localSetting.readingType != EReadingType.arabic,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              context
                      .watch<QuranProvider>()
                      .verseTranslation
                      ?.translations
                      ?.elementAt(verseModel.id! - 1)
                      .text ??
                  "",
              textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactor,
              style: context.theme.textTheme.titleSmall?.copyWith(
                fontFamily:
                    Fonts.getTranslationFont(context.watch<QuranProvider>().localSetting.fontType),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
