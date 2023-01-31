import 'package:fabrikod_quran/constants/constants.dart';

class LocalSettingModel {
  EQuranType quranType;
  EReadingType readingType;
  double textScaleFactor;
  double textScaleFactorArabic;
  String fontType = Fonts.translationFontNames.first;
  String fontTypeArabic = Fonts.arabicFontNames.first;

  LocalSettingModel({
    this.quranType = EQuranType.reading,
    this.readingType = EReadingType.all,
    this.textScaleFactor = 1.2,
    this.textScaleFactorArabic = 1.2,
    this.fontType = "Nunito",
    this.fontTypeArabic = "Nunito",
  });

  @override
  String toString() {
    return 'LocalSettingModel{quranType: $quranType, readingType: $readingType, textScaleFactor: $textScaleFactor, textScaleFactorArabic: $textScaleFactorArabic, fontType: $fontType, fontTypeArabic: $fontTypeArabic}';
  }

  factory LocalSettingModel.fromJson(Map<String, dynamic> json) => LocalSettingModel(
        quranType:
            json['quranType'] != null ? EQuranType.values[json['quranType']] : EQuranType.reading,
        readingType: json['readingType'] != null
            ? EReadingType.values[json['readingType']]
            : EReadingType.all,
        textScaleFactor: json['textScaleFactor'] ?? 1.2,
        textScaleFactorArabic: json['textScaleFactorArabic'] ?? 1.2,
        fontType: json['fontType'] ?? "Nunito",
        fontTypeArabic: json['fontTypeArabic'] ?? "Nunito",
      );

  Map<String, dynamic> toJson() => {
        'quranType': quranType.index,
        'readingType': readingType.index,
        'textScaleFactor': textScaleFactor,
        'textScaleFactorArabic': textScaleFactorArabic,
        'fontType': fontType,
        'fontTypeArabic': fontTypeArabic,
      };
}
