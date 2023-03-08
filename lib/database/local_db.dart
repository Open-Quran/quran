import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/enums.dart';
import '../models/bookmark_model.dart';
import '../models/local_setting_model.dart';
import '../models/recent_model.dart';
import '../models/verse_model.dart';

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
    return favoriteList
        .map((e) => VerseModel.fromJson(e))
        .toList()
        .cast<VerseModel>();
  }

  /// Add verse model into favorite list and save to db
  static Future<List<VerseModel>> addVerseToFavorites(
      VerseModel verseModel) async {
    var favoriteList = getFavoriteVerses;
    favoriteList.add(verseModel);
    var value = favoriteList.map((e) => e.toJson()).toList();
    await _localDbBox.write('favoriteVerses', value);
    return getFavoriteVerses;
  }

  /// Delete verse model from the favorite list from db
  static Future<List<VerseModel>> deleteVerseFromTheFavorites(
      VerseModel verseModel) async {
    var favoriteList = getFavoriteVerses;
    favoriteList.removeWhere((element) => element.id == verseModel.id);
    var value = favoriteList.map((e) => e.toJson()).toList();
    await _localDbBox.write('favoriteVerses', value);
    return getFavoriteVerses;
  }

  /// Get bookmarks from db
  static List<BookMarkModel> get getBookmarks {
    var bookmarkList = (_localDbBox.read('bookmarks') as List?) ?? [];
    return bookmarkList
        .map((e) => BookMarkModel.fromJson(e))
        .toList()
        .cast<BookMarkModel>();
  }

  /// Add bookmark in db
  static Future<List<BookMarkModel>> addBookmark(BookMarkModel bookMark) async {
    var bookmarkList = getBookmarks;
    bookmarkList.add(bookMark);
    var value = bookmarkList.map((e) => e.toJson()).toList();
    await _localDbBox.write('bookmarks', value);
    return getBookmarks;
  }

  /// Delete bookmark from db
  static Future<List<BookMarkModel>> deleteBookmark(
      BookMarkModel bookMark) async {
    var bookmarkList = getBookmarks;
    bookmarkList.removeWhere((element) => element == bookMark);
    var value = bookmarkList.map((e) => e.toJson()).toList();
    await _localDbBox.write('bookmarks', value);
    return getBookmarks;
  }

  /// Get recents from db
  static List<RecentModel>get getRecents {
    var recentList = (_localDbBox.read('recents') as List?) ?? [];
    return recentList
        .map((e) => RecentModel.fromJson(e))
        .toList()
        .cast<RecentModel>();
  }

  /// Add recent visited in db
  static Future<List<RecentModel>> addRecent(RecentModel recent) async {
    /// Checking if user clicked on same surah, juz, page or recent
    /// Do not add it to the list
    if(getRecents.isNotEmpty){
    var firstRecents = getRecents.reversed.first;
      if (firstRecents.index == recent.index) {
        return getRecents;
      }
    }
    var recentsList = getRecents;
    recentsList.add(recent);
    var value = recentsList.map((e) => e.toJson()).toList();
    await _localDbBox.write('recents', value);
    return getRecents;
  }

  /// Getting Local Settings Of Quran from Db
  static LocalSettingModel get getLocalSettingOfQuran {
    var result = _localDbBox.read('localSettingOfQuran');
    if (result == null) return LocalSettingModel();
    return LocalSettingModel.fromJson(result);
  }

  /// Adding Local Settings Of Quran to Db
  static Future<LocalSettingModel> setLocalSettingOfQuran(
      LocalSettingModel localSetting) async {
    await _localDbBox.write('localSettingOfQuran', localSetting.toJson());
    return getLocalSettingOfQuran;
  }

  /// Showcase delete button
  static bool get getShowCase {
    bool showCase = _localDbBox.read("showCase") ?? false;
    return showCase;
  }

  /// Set Showcase delete button
  static setShowCase(bool showCase) async {
    await _localDbBox.write("showCase", showCase);
  }
}
