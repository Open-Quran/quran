import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BookmarkProvider extends ChangeNotifier {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  /// Class Constructor
  BookmarkProvider() {
    bookmarks = LocalDb.getBookmarks;
  }

  /// Verse model list
  List<BookMarkModel> bookmarks = [];

  /// Checking if the verse bookmarked
  bool isBookmark(BookMarkModel bookMark) {
    return bookmarks.indexWhere((element) => element == bookMark) == -1
        ? false
        : true;
  }

  /// Adding bookmarks
  void onTapAddBookmark(VerseModel verse, EBookMarkType bookMarkType) async {
    var bookMark = BookMarkModel(bookmarkType: bookMarkType, verseModel: verse);
    bookmarks = await LocalDb.addBookmark(bookMark);
    notifyListeners();
  }

  /// Delete bookmarks
  void onTapDeleteBookmark(VerseModel verse, EBookMarkType bookMarkType) async {
    var bookMark = BookMarkModel(bookmarkType: bookMarkType, verseModel: verse);
    bookmarks = await LocalDb.deleteBookmark(bookMark);
    notifyListeners();
  }

  /// onTap bookmark card
  void bookmarkOnTap(BuildContext context, BookMarkModel bookmark) {
    ReadingSettingsModel model;
    switch (bookmark.bookmarkType) {
      case EBookMarkType.verse:
        model = ReadingSettingsModel(
          surahIndex: bookmark.verseModel.surahId! - 1,
          surahVerseIndex: bookmark.verseModel.verseNumber! - 1,
        );
        break;
      case EBookMarkType.page:
        context.read<QuranProvider>().changeQuranType(1);
        model = ReadingSettingsModel(
            mushafPageNumber: bookmark.verseModel.pageNumber!);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SurahDetailsProvider(context, model),
          child: const SurahDetailsScreen(),
        ),
      ),
    );
  }
}
