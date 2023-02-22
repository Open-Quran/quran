import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/managers/surah_detail_navigation_manager.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {

  /// Class Constructor
  BookmarkProvider() {
    bookmarks = LocalDb.getBookmarks;
  }

  /// Verse model list
  List<BookMarkModel> bookmarks = [];

  /// Checking if the verse bookmarked
  bool isBookmark(BookMarkModel bookMark) {
    var result = bookmarks.indexWhere((element) => element == bookMark);
    return result == -1 ? false : true;
  }

  /// When clicked to bookmark button
  void onTapBookMarkButton(EBookMarkType bookMarkType, VerseModel verseModel, bool isBookmark) {
    if (isBookmark) {
      deleteBookmark(verseModel, bookMarkType);
    } else {
      addBookmark(verseModel, bookMarkType);
    }
  }

  /// Add bookmark
  void addBookmark(VerseModel verse, EBookMarkType bookMarkType) async {
    var bookMark = BookMarkModel(bookmarkType: bookMarkType, verseModel: verse);
    bookmarks = await LocalDb.addBookmark(bookMark);
    notifyListeners();
  }

  /// Delete bookmark
  void deleteBookmark(VerseModel verse, EBookMarkType bookMarkType) async {
    var bookMark = BookMarkModel(bookmarkType: bookMarkType, verseModel: verse);
    bookmarks = await LocalDb.deleteBookmark(bookMark);
    notifyListeners();
  }

  /// onTap bookmark card
  void bookmarkOnTap(BuildContext context, BookMarkModel bookmark) {
    switch (bookmark.bookmarkType) {
      case EBookMarkType.verse:
        SurahDetailNavigationManager.goToSurah(
          context,
          bookmark.verseModel.surahId!,
          verseId: bookmark.verseModel.verseNumber!,
        );
        break;
      case EBookMarkType.page:
        SurahDetailNavigationManager.goToMushaf(
          context,
          bookmark.verseModel.pageNumber!,
        );
    }
  }
}
