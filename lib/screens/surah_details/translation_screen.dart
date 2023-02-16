import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/mushaf_backgrund_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/bookmark_provider.dart';
import 'package:fabrikod_quran/providers/favorites_provider.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:fabrikod_quran/widgets/cards/new_verse_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verses =
        context.watch<SurahDetailsProvider>().versesOfReadingTypeOrTranslation;
    return InkWell(
      onTap: context.read<SurahDetailsProvider>().changeReadingMode,
      child: ScrollablePositionedList.separated(
        itemCount: verses.length,
        itemScrollController:
            context.read<SurahDetailsProvider>().itemScrollController,
        itemPositionsListener:
            context.read<SurahDetailsProvider>().itemPositionsListener,
        padding: const EdgeInsets.only(
          left: kSizeM,
          right: kSizeL,
          bottom: kSizeXL,
        ),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final verse = verses[index];
          return Column(
            children: [
              BasmalaTitle(verseKey: verse.verseKey ?? ""),
              buildVerseCard(index, verse, context),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: kSizeM),
      ),
    );
  }

  VerseCard buildVerseCard(int index, VerseModel verse, BuildContext context) {
    return VerseCard(
      verseModel: verse,
      arabicFontFamily: Fonts.uthmanic,
      verseTranslations: context
          .watch<QuranProvider>()
          .translationService
          .translationsOfVerse(verse.id!),
      readOptions: context.watch<QuranProvider>().localSetting.readOptions,
      textScaleFactor:
          context.watch<QuranProvider>().localSetting.textScaleFactor,
      translationFontFamily: Fonts.getTranslationFont(
          context.watch<QuranProvider>().localSetting.fontType),
      isPlaying:
          context.watch<PlayerProvider>().isPlayingVerse(verse.verseKey ?? ""),
      playFunction: (verse, isPlaying) {
        context.read<SurahDetailsProvider>().onTapVerseCardPlayOrPause(
              index,
              isPlaying,
              verse.verseKey ?? "",
            );
      },
      isFavorite: context.watch<FavoritesProvider>().isFavoriteVerse(verse),
      favoriteFunction: context.read<FavoritesProvider>().onTapFavoriteButton,
      isBookmark: context.watch<BookmarkProvider>().isBookmark(
            BookMarkModel(bookmarkType: EBookMarkType.verse, verseModel: verse),
          ),
      bookmarkFunction: context.read<BookmarkProvider>().onTapBookMarkButton,
      shareFunction: (verseModel) {},
    );
  }
}
