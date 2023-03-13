class JsonPathConstants {
  JsonPathConstants._();

  /// Base path
  static const String _baseUrl = 'assets/json/';

  /// Path to file [quran.json]
  static const String quran = '${_baseUrl}quran.json';

  /// Path to translation file [verses.json]
  static String verseTranslations(String languageCode) =>
      '${_baseUrl}translations/${languageCode}_default.json';

  /// Path to file [translations.json]
  static const String translations = '${_baseUrl}translations/translations.json';
}
