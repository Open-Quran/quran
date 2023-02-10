import 'dart:convert';

import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';

class SearchModel {
  int? id;
  List<VerseModel> verses = [];
  List<SurahModel> surahs = [];
  SearchModel(
      {this.id,
      });


  @override
  String toString() {
    return 'SearchModel{id: $id, verses: $verses, surahs: $surahs}';
  }

  /// Checking is sajda verse
  bool get isSajdaVerse {
    int value = verses.indexWhere((element) => element.sajdahNumber != null);
    return value == -1 ? false : true;
  }

  /// Get all verses from the surah
  List<VerseModel> get allVerses {
    List<VerseModel> list = [];
    for (var element in verses) {
      list.add(element);
    }
    return list;
  }

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['verses'] != null) {
      verses = json['verses'].map((e) => VerseModel.fromJson(e)).toList().cast<VerseModel>();
    }
    if (json['surahs'] != null) {
      surahs = json['surahs'].map((e) => SurahModel.fromJson(json)).toList().cast<SurahModel>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['verses'] = verses.map((v) => v.toJson()).toList();
    data['surahs'] = surahs.map((v) => v.toJson()).toList();
    return data;
  }
}
