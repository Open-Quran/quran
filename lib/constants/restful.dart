class RestfulConstants {
  /// Audio Base Url
  static const String _baseUrl = 'https://verses.quran.com/';

  /// Getting verse audio Url
  static String getAudioUrlOfVerse(String audioUrl) => '$_baseUrl$audioUrl';

  /// Quran.com API end-point for the verse translations
  static String verseTranslation(int resourceId) =>
      "https://api.quran.com/api/v4/quran/translations/$resourceId";
}
