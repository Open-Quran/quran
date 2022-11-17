import 'package:fabrikod_quran/constants/constants.dart';

class ReadingSettingsModel {
  late ESurahDetailScreenMod surahDetailScreenMod;
  bool isReadingMode = false;
  int surahIndex = 0;
  int surahVerseIndex = 0;
  int juzIndex = 0;
  int sajdaIndex = 0;
  int mushafPageNumber = 1;

  ReadingSettingsModel({
    this.surahDetailScreenMod = ESurahDetailScreenMod.surah,
    this.isReadingMode = false,
    this.surahIndex = 0,
    this.surahVerseIndex = 0,
    this.juzIndex = 0,
    this.sajdaIndex = 0,
    this.mushafPageNumber = 1,
  });

  @override
  String toString() {
    return ' surahDetailScreenMod: $surahDetailScreenMod, surahIndex: $surahIndex, surahVerseIndex: $surahVerseIndex, juzIndex: $juzIndex, sajdaIndex: $sajdaIndex, mushafPageNumber: $mushafPageNumber}';
  }

  ReadingSettingsModel.fromJson(Map<String, dynamic> json) {
    surahDetailScreenMod = json['surahDetailScreenMod'] != null
        ? ESurahDetailScreenMod.values[json['surahDetailScreenMod']]
        : ESurahDetailScreenMod.surah;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surahDetailScreenMod'] = surahDetailScreenMod.index;
    return data;
  }
}
