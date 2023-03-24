import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants/enums.dart';
import '../../constants/fonts.dart';
import '../../constants/padding.dart';
import '../../models/bookmark_model.dart';
import '../../models/verse_model.dart';
import '../../providers/bookmark_provider.dart';
import '../../providers/favorites_provider.dart';
import '../../providers/player_provider.dart';
import '../../providers/quran_provider.dart';
import '../../providers/surah_details_provider.dart';
import '../../widgets/bars/reading_page_bottom_bar.dart';
import '../../widgets/basmala_title.dart';
import '../../widgets/cards/new_verse_card.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  /// Scroll Controller for Verse List
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Item position listener of Verse list
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      itemScrollController.jumpTo(index: context.read<SurahDetailsProvider>().jumpToVerseIndex);
      itemPositionsListener.itemPositions.addListener(scrollListener);
      listenToPlayer();
    });
  }

  /// Listen To Player
  void listenToPlayer() {
    context.read<PlayerProvider>().addListener(() {
      if (!mounted) return;
      if (context.read<PlayerProvider>().playerState == EPlayerState.playing) {
        itemScrollController.jumpTo(index: context.read<PlayerProvider>().playerIndex);
      }
    });
  }

  /// Scroll Listener
  void scrollListener() {
    var first = itemPositionsListener.itemPositions.value.first.index;
    var last = itemPositionsListener.itemPositions.value.last.index;
    var index = first <= last ? first : last;
    context.read<SurahDetailsProvider>().listenToTranslationScreenList(index);
  }

  @override
  Widget build(BuildContext context) {
    var verses = context.watch<SurahDetailsProvider>().displayedVerses;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: context.read<SurahDetailsProvider>().changeReadingMode,
        child: ScrollablePositionedList.separated(
          itemCount: verses.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
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
                Visibility(
                  visible: index == verses.length - 1,
                  child: const ReadingPageBottomBar(),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: kSizeM),
        ),
      ),
    );
  }

  VerseCard buildVerseCard(int index, VerseModel verse, BuildContext context) {
    return VerseCard(
      verseModel: verse,
      arabicFontFamily: Fonts.uthmanicIcon,
      verseTranslations: context.watch<QuranProvider>().translationService.translationsOfVerse(verse.id!),
      readOptions: context.watch<QuranProvider>().localSetting.readOptions,
      textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactor,
      translationFontFamily: Fonts.getTranslationFont(context.watch<QuranProvider>().localSetting.fontType),
      isPlaying: context.watch<PlayerProvider>().isPlayingVerse(verse.verseKey ?? ""),
      playFunction: (verse, isPlaying) {
        context.read<SurahDetailsProvider>().onTapVerseCardPlayOrPause(
              index,
              isPlaying,
            );
      },
      isFavorite: context.watch<FavoritesProvider>().isFavoriteVerse(verse),
      favoriteFunction: context.read<FavoritesProvider>().onTapFavoriteButton,
      isBookmark: context.watch<BookmarkProvider>().isBookmark(
            BookMarkModel(bookmarkType: EBookMarkType.verse, verseModel: verse),
          ),
      bookmarkFunction: context.read<BookmarkProvider>().onTapBookMarkButton,
      shareFunction: (verseModel) {
        context.read<SurahDetailsProvider>().shareVerse(verseModel, index);
      },
      selectedVerseKey: context.watch<SurahDetailsProvider>().selectedVerseKey,
      changeSelectedVerseKey: context.read<SurahDetailsProvider>().changeSelectedVerseKey,
    );
  }
}
