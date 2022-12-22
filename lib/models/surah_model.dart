import 'dart:convert';

import 'package:fabrikod_quran/models/verse_model.dart';

class SurahModel {
  int? id;
  String? revelationPlace;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  String? nameTranslated;
  int? startPage;
  int? endPage;
  List<VerseModel> verses = [];
  List<String> searchSuggestions = [];

  SurahModel(
      {this.id,
      this.revelationPlace,
      this.nameSimple,
      this.nameComplex,
      this.nameArabic,
      this.nameTranslated,
      this.startPage,
      this.endPage});

  @override
  String toString() {
    return 'Surah{id: $id, revelationPlace: $revelationPlace, nameSimple: $nameSimple, nameComplex: $nameComplex, nameArabic: $nameArabic, nameTranslated: $nameTranslated, startPage: $startPage, endPage: $endPage}';
  }

  /// Checking is sajda verse
  bool get isSajdaVerse {
    int value = verses.indexWhere((element) => element.sajdahNumber != null);
    return value == -1 ? false : true;
  }

  /// Get the sajda verses in the surah
  List<VerseModel> get sajdaVerses {
    List<VerseModel> list = [];
    for (var element in verses) {
      if (element.sajdahNumber != null) list.add(element);
    }
    return list;
  }

  /// Filters and returns juz verses
  List<VerseModel> juzVerses(int juzIndex) {
    List<VerseModel> list = [];
    for (var element in verses) {
      if (element.juzNumber == juzIndex + 1) list.add(element);
    }
    return list;
  }

  /// Filters and return juz numbers of Surah
  List<int> get juzNumbers {
    List<int> juzNumbers = [];
    for (var element in verses) {
      if(juzNumbers.contains(element.juzNumber)) continue;
      if(element.juzNumber == null) continue;
      juzNumbers.add(element.juzNumber!);
    }
    return juzNumbers;
  }

  /// Get surahs of the selected mushaf page
  SurahModel? surahOfMushafPage(int mushafPageNo) {
    var newVerses = verses.where((element) => element.pageNumber == mushafPageNo).toList();
    if (newVerses.isEmpty) return null;
    var newSurah = clone;
    newSurah.verses = newVerses;
    return newSurah;
  }

  /// Cloning the model
  SurahModel get clone {
    final String jsonString = json.encode(toJson());
    final jsonResponse = json.decode(jsonString) as Map<String, dynamic>;
    return SurahModel.fromJson(jsonResponse);
  }

  SurahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    nameTranslated = json['name_translated'];
    startPage = json['start_page'];
    endPage = json['end_page'];
    if (json['verses'] != null) {
      verses = json['verses'].map((e) => VerseModel.fromJson(e)).toList().cast<VerseModel>();
    }
  }

  SurahModel.fromJsonQuranApi(Map<String, dynamic> json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    nameTranslated = json['translated_name']['name'];
    startPage = (json['pages'] as List).first;
    endPage = (json['pages'] as List)[1];
    if (json['verses'] != null) {
      verses =
          json['verses'].map((e) => VerseModel.fromJsonForQuranApi(e)).toList().cast<VerseModel>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['revelation_place'] = revelationPlace;
    data['name_simple'] = nameSimple;
    data['name_complex'] = nameComplex;
    data['name_arabic'] = nameArabic;
    data['name_translated'] = nameTranslated;
    data['start_page'] = startPage;
    data['end_page'] = endPage;
    data['verses'] = verses.map((v) => v.toJson()).toList();

    return data;
  }
}
