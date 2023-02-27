import 'dart:io';

import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:fabrikod_quran/services/network_service.dart';

class TranslationService {

  /// Class constructor
  TranslationService() {
    _init();
  }

  /// List of all translation Country
  late List<TranslationCountry> allTranslationCountry;

  /// Initialization method
  /// Filling lists of translations
  Future _init() async {
    allTranslationCountry = await AssetQuranService.getTranslations();
    await _getVerseTranslationListFromAsset("en", 131);
    await _getVerseTranslationListFromAsset("tr", 77);
  }

  /// List of selected translations in downloaded list
  List<TranslationAuthor> get selectedTranslationAuthors {
    List<TranslationAuthor> list = [];
    for (var element in allTranslationCountry) {
      for (var element in element.downloadedList) {
        if (element.isSelectedTranslation) list.add(element);
      }
    }
    return list;
  }

  /// Get specific verse translation
  List<VerseTranslation> translationsOfVerse(int verseId) {
    List<VerseTranslation> list = [];
    for (var translationCountry in allTranslationCountry) {
      for (var translationsAuthor in translationCountry.downloadedList) {
        if (translationsAuthor.isSelectedTranslation) {
          list.add(translationsAuthor.verseTranslations[verseId - 1]);
        }
      }
    }
    return list;
  }

  /// Get all verse translations
  String? get translationButtonName {
    var list = selectedTranslationAuthors;
    if (list.isEmpty) {
      return null;
    }
    if (list.length == 1) {
      return "${list.first.translationName}";
    }
    return "${list.first.translationName} +${list.length}";
  }

  /// Get verse translation names
  String translationsName(int resourceId) {
    var value = selectedTranslationAuthors.firstWhere((element) => element.resourceId == resourceId);
    return value.translationName ?? "";
  }

  /// Get translations from assets
  Future _getVerseTranslationListFromAsset(String countryCode, int resourceId) async {
    List<VerseTranslation> result = await AssetQuranService.getVerseTranslationList(countryCode);
    TranslationAuthor? translationAuthor = _getTranslationAuthor(resourceId);
    if (translationAuthor == null) return;
    translationAuthor.verseTranslations = result;
    translationAuthor.verseTranslationState = EVerseTranslationState.downloaded;

    for (var element in translationAuthor.verseTranslations) {
      element.translationName = translationAuthor.translationName;
    }

    String localCountryCode =
        LocalDb.getLocale?.countryCode ?? Platform.localeName.split("_").first;
    if (localCountryCode == countryCode) translationAuthor.isSelectedTranslation = true;
  }

  /// Get translation author name
  TranslationAuthor? _getTranslationAuthor(int? resourceId) {
    if (resourceId == null) return null;
    for (var element in allTranslationCountry) {
      for (var element in element.translationsAuthor) {
        if (element.resourceId == resourceId) return element;
      }
    }
    return null;
  }

  /// Downloading translations from Quran.com API V4
  Future<bool> downloadTranslationFromNetwork(TranslationAuthor translationAuthor) async {
    try {
      translationAuthor.verseTranslations =
          await NetworkService.fetchVerseTranslationList(translationAuthor.resourceId!);

      for (var element in translationAuthor.verseTranslations) {
        element.translationName = translationAuthor.translationName;
      }

      return translationAuthor.verseTranslations.isEmpty ? false : true;
    } catch (e) {
      return false;
    }
  }
}
