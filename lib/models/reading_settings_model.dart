import 'package:fabrikod_quran/constants/constants.dart';

class ReadingSettingsModel {
  late EQuranType quranType;

  late ESurahDetailScreenMod surahDetailScreenMod;
  bool isReadingMode = false;
  int surahIndex = 0;
  int surahVerseIndex = 0;
  int juzIndex = 0;
  int sajdaIndex = 0;
  int mushafPageNumber = 1;

  ReadingSettingsModel({
    this.quranType = EQuranType.translation,
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
    return 'ReadingSettingsModel{readingType: $quranType, surahDetailScreenMod: $surahDetailScreenMod, surahIndex: $surahIndex, surahVerseIndex: $surahVerseIndex, juzIndex: $juzIndex, sajdaIndex: $sajdaIndex, mushafPageNumber: $mushafPageNumber}';
  }

  ReadingSettingsModel.fromJson(Map<String, dynamic> json) {
    quranType =
        json['quranType'] != null ? EQuranType.values[json['quranType']] : EQuranType.translation;
    surahDetailScreenMod = json['surahDetailScreenMod'] != null
        ? ESurahDetailScreenMod.values[json['surahDetailScreenMod']]
        : ESurahDetailScreenMod.surah;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quranType'] = quranType.index;
    data['surahDetailScreenMod'] = surahDetailScreenMod.index;
    return data;
  }
}
