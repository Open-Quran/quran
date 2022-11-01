class JsonPathConstants {
  JsonPathConstants._();

  /// BASE CONSTANTS
  static const String _baseUrl = 'assets/json/';

  /// QURAN CONSTANTS
  static const String quran = '${_baseUrl}quran.json';

  static String verseTranslations(String languageCode) =>
      '${_baseUrl}translations/${languageCode}_verses.json';
}
