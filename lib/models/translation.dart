import 'package:fabrikod_quran/constants/constants.dart';

class TranslationCountry {
  String? name;
  late List<TranslationAuthor> translationsAuthor;

  TranslationCountry({this.name, required this.translationsAuthor});

  TranslationCountry.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['translations'] != null) {
      translationsAuthor = [];
      json['translations'].forEach((v) {
        translationsAuthor.add(TranslationAuthor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['translations'] = translationsAuthor.map((v) => v.toJson()).toList();

    return data;
  }

  List<TranslationAuthor> get downloadedList {
    return translationsAuthor
        .where((element) => element.verseTranslationState == EVerseTranslationState.downloaded)
        .toList();
  }
}

class TranslationAuthor {
  String? translationName;
  String? authorName;
  int? resourceId;
  bool isSelectedTranslation = false;
  EVerseTranslationState verseTranslationState = EVerseTranslationState.download;
  List<VerseTranslation> verseTranslations = [];

  TranslationAuthor({this.translationName, this.authorName, this.resourceId});

  TranslationAuthor.fromJson(Map<String, dynamic> json) {
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
