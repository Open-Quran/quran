class VerseModel {
  int? id;
  int? verseNumber;
  int? surahId;
  String? verseKey;
  int? juzNumber;
  int? hizbNumber;
  int? rubElHizbNumber;
  int? sajdahNumber;
  int? pageNumber;
  String? text;
  String? audioUrl;

  VerseModel(
      {this.id,
      this.verseNumber,
      this.surahId,
      this.verseKey,
      this.juzNumber,
      this.hizbNumber,
      this.rubElHizbNumber,
      this.sajdahNumber,
      this.pageNumber,
      this.text,
      this.audioUrl});

  @override
  String toString() {
    return 'VerseModel{id: $id, verseNumber: $verseNumber, surahId: $surahId, verseKey: $verseKey, juzNumber: $juzNumber, hizbNumber: $hizbNumber, rubElHizbNumber: $rubElHizbNumber, sajdahNumber: $sajdahNumber, pageNumber: $pageNumber, text: $text, audioUrl: $audioUrl}';
  }

  VerseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    surahId = json['surah_id'];
    verseKey = json['verse_key'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubElHizbNumber = json['rub_el_hizb_number'];
    sajdahNumber = json['sajdah_number'];
    pageNumber = json['page_number'];
    text = json['text'];
    audioUrl = json['audio_url'];
  }

  VerseModel.fromJsonForQuranApi(Map<String, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    surahId = json['chapter_id'];
    verseKey = json['verse_key'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubElHizbNumber = json['rub_el_hizb_number'];
    sajdahNumber = json['sajdah_number'];
    pageNumber = json['page_number'];
    text = json['text_madani'];
    audioUrl = json['audio']['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['verse_number'] = verseNumber;
    data['surah_id'] = surahId;
    data['verse_key'] = verseKey;
    data['juz_number'] = juzNumber;
    data['hizb_number'] = hizbNumber;
    data['rub_el_hizb_number'] = rubElHizbNumber;
    data['sajdah_number'] = sajdahNumber;
    data['page_number'] = pageNumber;
    data['text'] = text;
    data['audio_url'] = audioUrl;
    return data;
  }
}