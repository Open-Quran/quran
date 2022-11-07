import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalDb {
  LocalDb._();

  static final GetStorage _localDbBox = GetStorage('FabrikodQuran');

  /// Get locale from local database
  static Locale? get getLocale {
    String? code = _localDbBox.read('languageCode');
    if (code == null) return null;
    return Locale(code);
  }

  /// Change locale from local database
  static Future<Locale?> setLocale(String languageCode) async {
    await _localDbBox.write('languageCode', languageCode);
    return getLocale;
  }

  /// Get theme mode from local database
  static EThemeModes get getThemeMode {
    int? value = _localDbBox.read('themeMode');
    if (value == null) return EThemeModes.light;
    return EThemeModes.values[value];
  }

  /// Change theme mode from local database
  static Future<EThemeModes> setThemeMode(EThemeModes appThemeMode) async {
    await _localDbBox.write('themeMode', appThemeMode.index);
    return getThemeMode;
  }

  /// Get favorite verses
  static List<VerseModel> get getFavoriteVerses {
    var favoriteList = (_localDbBox.read('favoriteVerses') as List?) ?? [];
    return favoriteList.map((e) => VerseModel.fromJson(e)).toList().cast<VerseModel>();
  }

  /// Add verse model into favorite list and save to db
  static Future<List<VerseModel>> addVerseToFavorites(VerseModel verseModel) async {
    var favoriteList = getFavoriteVerses;
    favoriteList.add(verseModel);
    var value = favoriteList.map((e) => e.toJson()).toList();
    await _localDbBox.write('favoriteVerses', value);
    return getFavoriteVerses;
  }

  /// Delete verse model from the favorite list in db
  static Future<List<VerseModel>> deleteVerseFromTheFavorites(VerseModel verseModel) async {
    var favoriteList = getFavoriteVerses;
    favoriteList.removeWhere((element) => element.id==verseModel.id);
    var value = favoriteList.map((e) => e.toJson()).toList();
    await _localDbBox.write('favoriteVerses', value);
    return getFavoriteVerses;
  }

  /// Get bookmarked verses from db
  static List<VerseModel> get getBookmarkVerses {
    var bookmarkList = (_localDbBox.read('bookmarkVerses') as List?) ?? [];
    return bookmarkList.map((e) => VerseModel.fromJson(e)).toList().cast<VerseModel>();
  }

  /// Add verse model into bookmark list in db
  static Future<List<VerseModel>> addBookmarkedVerse(VerseModel verseModel) async {
    var bookmarkList = getBookmarkVerses;
    bookmarkList.add(verseModel);
    var value = bookmarkList.map((e) => e.toJson()).toList();
    await _localDbBox.write('bookmarkVerses', value);
    return getBookmarkVerses;
  }

  /// Delete verse model from the bookmark list from db
  static Future<List<VerseModel>> deleteBookmarkedVerse(VerseModel verseModel) async {
    var bookmarkList = getBookmarkVerses;
    bookmarkList.removeWhere((element) => element.id==verseModel.id);
    var value = bookmarkList.map((e) => e.toJson()).toList();
    await _localDbBox.write('bookmarkVerses', value);
    return getBookmarkVerses;
  }
}
