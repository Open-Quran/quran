import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/enums.dart';
import '../../constants/padding.dart';
import '../../models/bookmark_model.dart';
import '../../models/translation.dart';
import '../../models/verse_model.dart';
import '../../providers/bookmark_provider.dart';
import '../../providers/favorites_provider.dart';
import '../../providers/player_provider.dart';
import '../../providers/quran_provider.dart';
import '../../providers/surah_details_provider.dart';
import '../../services/copy_and_share_service.dart';
import '../custom_space.dart';
import 'action_card.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({Key? key, required this.verseModel, this.isFavorite = false})
      : super(key: key);

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
    bool isPlaying = context
        .watch<PlayerProvider>()
        .isPlayingVerse(verseModel.verseKey ?? "");
    bool isFavorite =
        context.watch<FavoritesProvider>().isFavoriteVerse(verseModel);
    bool isBookmarked = context.watch<BookmarkProvider>().isBookmark(
          BookMarkModel(
              verseModel: verseModel, bookmarkType: EBookMarkType.verse),
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
      playButtonOnTap: (isPlaying) => context
          .read<SurahDetailsProvider>()
          .onTapVerseCardPlayOrPause(0, isPlaying),
      isFavorite: isFavorite,
      favoriteButtonOnTap: () => isFavorite
          ? context
              .read<FavoritesProvider>()
              .deleteVerseFromFavorites(verseModel)
          : context.read<FavoritesProvider>().addVerseToFavorite(verseModel),
      isBookmark: isBookmarked,
    );
  }

  Widget buildVerse(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kSizeXL),
        buildVerseText(context),
        const SizedBox(height: kSizeXL),
        buildVerseTranslationText(context),
        Divider(thickness: 1, color: context.theme.dividerColor)
      ],
    );
  }

  /// Verse Text
  Widget buildVerseText(BuildContext context) {
    return Visibility(
      visible: isFavorite ||
          context.watch<QuranProvider>().localSetting.readOptions !=
              EReadOptions.translation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              verseModel.text ?? "",
              textDirection: TextDirection.rtl,
              textScaleFactor:
                  context.watch<QuranProvider>().localSetting.textScaleFactor,
              style: context.theme.textTheme.headlineLarge?.copyWith(
                fontSize: 22,
                fontFamily: Fonts.getArabicFont(
                    context.watch<QuranProvider>().localSetting.fontTypeArabic),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Verse Translation Text
  Widget buildVerseTranslationText(BuildContext context) {
    List<VerseTranslation> translationList = context
        .watch<QuranProvider>()
        .translationService
        .translationsOfVerse(verseModel.id!);
    return Visibility(
      visible: isFavorite ||
          context.watch<QuranProvider>().localSetting.readOptions !=
              EReadOptions.surah,
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
                          textScaleFactor: context
                              .watch<QuranProvider>()
                              .localSetting
                              .textScaleFactor,
                          style: context.theme.textTheme.titleSmall?.copyWith(
                            fontFamily: Fonts.getTranslationFont(context
                                .watch<QuranProvider>()
                                .localSetting
                                .fontType),
                          ),
                        ),
                        CustomSpace.normal(),
                        Text(
                          "- ${context.read<QuranProvider>().translationService.translationsName(e.resourceId!)}",
                          textScaleFactor: context
                              .watch<QuranProvider>()
                              .localSetting
                              .textScaleFactor,
                          style:
                              context.theme.textTheme.headlineLarge?.copyWith(
                            fontFamily: Fonts.getTranslationFont(context
                                .watch<QuranProvider>()
                                .localSetting
                                .fontType),
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
