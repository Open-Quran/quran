class VerseTranslation {
  List<Translations>? translations;
  Meta? meta;

  @override
  String toString() {
    return 'VerseTranslation{translations: $translations, meta: $meta}';
  }

  VerseTranslation({this.translations, this.meta});

  VerseTranslation.fromJson(Map<String, dynamic> json) {
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Translations {
  String? text;

  @override
  String toString() {
    return 'Translations{text: $text}';
  }

  Translations({this.text});

  Translations.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}

class Meta {
  String? translationName;
  String? authorName;
  int? resourceId;

  @override
  String toString() {
    return 'Meta{translationName: $translationName, authorName: $authorName, resourceId: $resourceId}';
  }

  Meta({this.translationName, this.authorName, this.resourceId});

  Meta.fromJson(Map<String, dynamic> json) {
    translationName = json['translation_name'];
    authorName = json['author_name'];
    resourceId = json['filters']['resource_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['translation_name'] = translationName;
    data['author_name'] = authorName;
    data['resource_id'] = resourceId;

    return data;
  }
}
