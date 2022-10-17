import '../constants/enums.dart';

class ReadingSettingsModel {
  ReadingType readingType = ReadingType.translation;

  @override
  String toString() {
    return 'readingType: $readingType}';
  }

  ReadingSettingsModel({
    this.readingType = ReadingType.translation,
  });

  ReadingSettingsModel.fromJson(Map<String, dynamic> json) {
    readingType = json['readingType'] != null
        ? ReadingType.values[json['readingType']]
        : ReadingType.translation;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['readingType'] = readingType.index;
    return data;
  }
}
