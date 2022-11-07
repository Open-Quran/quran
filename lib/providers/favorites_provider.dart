import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {

  /// Class Constructor
  FavoritesProvider() {
    favoriteVerses = LocalDb.getFavoriteVerses;
  }

  /// Empty list model
  List<VerseModel> favoriteVerses = [];

  /// Checking if the verse favorite
  bool isFavoriteVerse(VerseModel verseModel) {
    return favoriteVerses.indexWhere((element) => element.id == verseModel.id) == -1 ? false : true;
  }

  /// Adding the verse to the favorites
  void addVerseToFavorite(VerseModel verseModel) async {
    favoriteVerses = await LocalDb.addVerseToFavorites(verseModel);
    notifyListeners();
  }

  /// Deleting the verse from the favorites
  void deleteVerseFromFavorites(VerseModel verseModel) async {
    favoriteVerses = await LocalDb.deleteVerseFromTheFavorites(verseModel);
    notifyListeners();
  }
}
