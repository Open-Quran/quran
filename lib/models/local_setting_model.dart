import 'package:fabrikod_quran/constants/constants.dart';

class LocalSettingModel {
  EQuranType quranType;
  EReadingType readingType;
  double textScaleFactor;

  LocalSettingModel({
    this.quranType = EQuranType.reading,
    this.readingType = EReadingType.all,
    this.textScaleFactor = 1.2,
  });

  @override
  String toString() {
    return 'LocalSettingModel{quranType: $quranType, readingType: $readingType, textScaleFactor: $textScaleFactor}';
  }

  factory LocalSettingModel.fromJson(Map<String, dynamic> json) => LocalSettingModel(
        quranType:
            json['quranType'] != null ? EQuranType.values[json['quranType']] : EQuranType.reading,
        readingType: json['readingType'] != null
            ? EReadingType.values[json['readingType']]
            : EReadingType.all,
        textScaleFactor: json['textScaleFactor'] ?? 1.2,
      );

  Map<String, dynamic> toJson() => {
        'quranType': quranType.index,
        'readingType': readingType.index,
        'textScaleFactor': textScaleFactor,
      };
}
