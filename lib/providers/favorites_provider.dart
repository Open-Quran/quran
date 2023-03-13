import 'package:flutter/material.dart';

import '../database/local_db.dart';
import '../managers/surah_detail_navigation_manager.dart';
import '../models/verse_model.dart';

class FavoritesProvider extends ChangeNotifier {
  /// Class Constructor
  FavoritesProvider() {
    favoriteVerses = LocalDb.getFavoriteVerses;
  }

  /// Empty list model
  List<VerseModel> favoriteVerses = [];

  /// Checking if the verse favorite
  bool isFavoriteVerse(VerseModel verseModel) {
    var result =
        favoriteVerses.indexWhere((element) => element.id == verseModel.id);
    return result == -1 ? false : true;
  }

  /// Make favorite or remove from favorite
  onTapFavoriteButton(VerseModel verseModel, bool isFavorite) {
    if (isFavorite) {
      deleteVerseFromFavorites(verseModel);
    } else {
      addVerseToFavorite(verseModel);
    }
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

  /// Favorite card onTap
  void onTapFavoriteCard(BuildContext context, VerseModel verseModel) {
    SurahDetailNavigationManager.goToSurah(
      context,
      verseModel.surahId!,
      verseId: verseModel.verseNumber!,
    );
  }
}
