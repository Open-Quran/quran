class RestfulConstants {
  /// Audio Base Url
  static const String _baseUrl = 'https://verses.quran.com/';

  /// Getting verse audio Url
  static String getAudioUrlOfVerse(String audioUrl) => '$_baseUrl$audioUrl';
}
