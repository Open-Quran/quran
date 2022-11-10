import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMarkProvider extends ChangeNotifier {
  /// Class Constructor
  BookMarkProvider() {
    bookmarks = LocalDb.getBookmarks;
  }

  /// Verse model list
  List<BookMarkModel> bookmarks = [];

  /// Checking if the verse bookmarked
  bool isBookmark(BookMarkModel bookMark) {
    return bookmarks.indexWhere((element) => element == bookMark) == -1 ? false : true;
  }

  /// Adding bookmarks
  void _addBookmarked(BookMarkModel bookMark) async {
    bookmarks = await LocalDb.addBookmarked(bookMark);
    notifyListeners();
  }

  /// Delete bookmarks
  void _deleteBookmarked(BookMarkModel bookMark) async {
    bookmarks = await LocalDb.deleteBookmarked(bookMark);
    notifyListeners();
  }

  /// onTap for bookmark icons on pages
  void bookmarkIconOnTap(bool isBookmarked, VerseModel verse, EBookMarkType bookMarkType) {
    var bookMark = BookMarkModel(bookMarkType: bookMarkType, verseModel: verse);
    isBookmarked ? _deleteBookmarked(bookMark) : _addBookmarked(bookMark);
  }

  ///onTap For bookmark card
  void bookmarkOnTap(BuildContext context, BookMarkModel bookmark) {
    ReadingSettingsModel model;
    switch (bookmark.bookMarkType) {
      case EBookMarkType.verse:
        model = ReadingSettingsModel(
          surahIndex: bookmark.verseModel.surahId! - 1,
          surahVerseIndex: bookmark.verseModel.verseNumber! - 1,
        );
        break;
      case EBookMarkType.page:
        model = ReadingSettingsModel(
          readingType: EReadingType.reading,
          mushafPageNumber: bookmark.verseModel.pageNumber!,
        );
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
