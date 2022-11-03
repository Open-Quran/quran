import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

class BookMarkProvider extends ChangeNotifier {
  /// Class Constructor
  BookMarkProvider() {
    bookmarkVerses = LocalDb.getBookmarkVerses;
  }

  List<VerseModel> bookmarkVerses = [];

  bool isBookmarkVerse(VerseModel verseModel) {
    return bookmarkVerses.indexWhere((element) => element.id == verseModel.id) == -1 ? false : true;
  }

  void addBookmarkVerse(VerseModel verseModel) async {
    bookmarkVerses = await LocalDb.addBookmarkVerse(verseModel);
    notifyListeners();
  }

  void deleteBookmarkVerse(VerseModel verseModel) async {
    bookmarkVerses = await LocalDb.deleteBookmarkVerse(verseModel);
    notifyListeners();
  }
}
