import 'dart:io';

import 'package:fabrikod_quran/database/local_db.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:fabrikod_quran/services/network_service.dart';

class TranslationService {

  /// List of all translations
  late List<Translation> allTranslation;

  /// List of active translations
  /// Active translation are selected translations
  late List<Translations> activeTranslations;

  TranslationService() {
    _init();
  }

  /// Initialization method
  /// Filling lists of translations
  Future _init() async {
    allTranslation = await AssetQuranService.getTranslations();
    await _getVerseTranslationListFromAsset("en", 131);
    await _getVerseTranslationListFromAsset("tr", 77);
    _updateActiveTranslations();
  }

  /// Get update list of active translations
  void _updateActiveTranslations() {
    List<Translations> list = [];
    for (var element in allTranslation) {
      for (var element in element.translations) {
        if (element.isShow) list.add(element);
      }
    }
    activeTranslations = list;
  }

  /// Get specific verse translation
  List<VerseTranslation> translationsOfVerse(int verseId) {
    List<VerseTranslation> list = [];
    for (var element in activeTranslations) {
      list.add(element.verseTranslations[verseId - 1]);
    }
    return list;
  }

  /// Get all verse translations
  List<VerseTranslation> get getAllVerseTranslations {
    List<VerseTranslation> verseTranslationList = [];
    return verseTranslationList;
  }

  /// Get verse translation names
  String translationsName(int resourceId) {
    var value = activeTranslations
        .firstWhere((element) => element.resourceId == resourceId);
    return value.translationName ?? "";
  }

  /// Get translations from assets
  Future _getVerseTranslationListFromAsset(
      String countryCode, int resourceId) async {
    List<VerseTranslation> result =
        await AssetQuranService.getVerseTranslationList(countryCode);
    Translations? translations = _getTranslations(resourceId);
    if (translations == null) return;
    translations.verseTranslations = result;

    for (var element in translations.verseTranslations) {
      element.translationName = translations.translationName;
    }

    String localCountryCode =
        LocalDb.getLocale?.countryCode ?? Platform.localeName.split("_").first;
    if (localCountryCode == countryCode) translations.isShow = true;
  }

  /// Get translations
  Translations? _getTranslations(int? resourceId) {
    if (resourceId == null) return null;
    for (var element in allTranslation) {
      for (var element in element.translations) {
        if (element.resourceId == resourceId) return element;
      }
    }
    return null;
  }

  /// Filling list of selected translation
  Future<void> selectedTranslation(int? resourceId) async {
    Translations? translations = _getTranslations(resourceId);
    if (translations == null) return;
    translations.isShow = !translations.isShow;
    await _getVerseTranslationFromNetwork(translations);
    if (translations.verseTranslations.isEmpty) translations.isShow = false;
    _updateActiveTranslations();
  }

  /// Get translations from API
  Future<void> _getVerseTranslationFromNetwork(
      Translations translations) async {
    if (!translations.isShow || translations.verseTranslations.isNotEmpty){
      return;
    }
    translations.verseTranslations =
        await NetworkService.fetchVerseTranslationList(
            translations.resourceId!);

    for (var element in translations.verseTranslations) {
      element.translationName = translations.translationName;
    }
  }
}
