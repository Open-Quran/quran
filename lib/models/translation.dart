import 'package:fabrikod_quran/constants/constants.dart';

class Translation {
  String? name;
  late List<Translations> translations;

  Translation({this.name, required this.translations});

  Translation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['translations'] != null) {
      translations = [];
      json['translations'].forEach((v) {
        translations.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['translations'] = translations.map((v) => v.toJson()).toList();

    return data;
  }
}

class Translations {
  String? translationName;
  String? authorName;
  int? resourceId;
  bool isShow = false;
  List<VerseTranslation> verseTranslations = [];

  Translations({this.translationName, this.authorName, this.resourceId});

  Translations.fromJson(Map<String, dynamic> json) {
    translationName = json['translation_name'];
    authorName = json['author_name'];
    resourceId = json['resource_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['translation_name'] = translationName;
    data['author_name'] = authorName;
    data['resource_id'] = resourceId;
    return data;
  }
}

class VerseTranslation {
  int? resourceId;
  String? text;

  /// Expired Data
  String? translationName;

  VerseTranslation({this.resourceId, this.text});

  VerseTranslation.fromJson(Map<String, dynamic> json) {
    resourceId = json['resource_id'];
    text = Utils.parseHtmlQuranTranslation(json['text']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource_id'] = resourceId;
    data['text'] = text;
    return data;
  }
}
