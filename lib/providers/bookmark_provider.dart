import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

class BookMarkProvider extends ChangeNotifier {

  /// Class Constructor
  BookMarkProvider() {
    bookmarkVerses = LocalDb.getBookmarkVerses;
  }

  /// Verse model list
  List<VerseModel> bookmarkVerses = [];

  /// Checking if the verse bookmarked
  bool isBookmarkVerse(VerseModel verseModel) {
    return bookmarkVerses.indexWhere((element) => element.id == verseModel.id) == -1 ? false : true;
  }

  /// Adding the verse to the bookmarks
  void addBookmarkVerse(VerseModel verseModel) async {
    bookmarkVerses = await LocalDb.addBookmarkedVerse(verseModel);
    notifyListeners();
  }

  /// Delete the verse from the bookmarks
  void deleteBookmarkVerse(VerseModel verseModel) async {
    bookmarkVerses = await LocalDb.deleteBookmarkedVerse(verseModel);
    notifyListeners();
  }
}
