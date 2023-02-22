
import '../constants/enums.dart';

class ReadingSettingsModel {
  late ESurahDetailScreenMode surahDetailScreenMode;
  bool isReadingMode = false;
  int surahId = 1;
  int verseId = 1;
  int juzId = 1;
  int mushafPageNumber = 1;

  ReadingSettingsModel({
    this.surahDetailScreenMode = ESurahDetailScreenMode.surah,
    this.isReadingMode = false,
    this.surahId = 1,
    this.verseId = 1,
    this.juzId = 1,
    this.mushafPageNumber = 1,
  });

  int get surahIndex => surahId - 1;

  set surahIndex(int value) {
    surahId = value + 1;
  }

  int get verseIndex => verseId - 1;

  set verseIndex(int value) {
    verseId = value + 1;
  }

  int get juzIndex => juzId - 1;

  set juzIndex(int value) {
    juzId = value + 1;
  }

  @override
  String toString() {
    return 'ReadingSettingsModel{surahDetailScreenMode: $surahDetailScreenMode, isReadingMode: $isReadingMode, surahId: $surahId, verseId: $verseId, juzId: $juzId, mushafPageNumber: $mushafPageNumber}';
  }
}
