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

  SurahModel.fromJsonForQuranApi(Map<String, dynamic> json) {
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
