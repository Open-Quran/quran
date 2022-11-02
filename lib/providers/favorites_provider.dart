import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  /// Class Constructor
  FavoritesProvider() {
    favoriteVerses = LocalDb.getFavoriteVerses;
  }

  List<VerseModel> favoriteVerses = [];

  bool isFavoriteVerse(VerseModel verseModel) {
    return favoriteVerses.indexWhere((element) => element.id == verseModel.id) == -1 ? false : true;
  }

  void addFavoriteVerse(VerseModel verseModel) async {
    favoriteVerses = await LocalDb.addFavoriteVerse(verseModel);
    notifyListeners();
  }

  void deleteFavoriteVerse(VerseModel verseModel) async {
    favoriteVerses = await LocalDb.deleteFavoriteVerse(verseModel);
    notifyListeners();
  }
}
