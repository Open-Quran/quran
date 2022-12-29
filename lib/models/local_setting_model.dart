import 'package:fabrikod_quran/constants/constants.dart';

class LocalSettingModel {
  EQuranType quranType;
  EReadOptions readOptions;
  double textScaleFactor;
  double textScaleFactorArabic;
  String fontType = Fonts.translationFontNames.first;
  String fontTypeArabic = Fonts.arabicFontNames.first;

  LocalSettingModel({
    this.quranType = EQuranType.reading,
    this.readOptions = EReadOptions.surahAndTranslation,
    this.textScaleFactor = 1.2,
    this.textScaleFactorArabic = 1.2,
    this.fontType = "Nunito",
    this.fontTypeArabic = "Nunito",
  });

  @override
  String toString() {
    return 'LocalSettingModel{quranType: $quranType, readOptions: $readOptions, textScaleFactor: $textScaleFactor, textScaleFactorArabic: $textScaleFactorArabic, fontType: $fontType, fontTypeArabic: $fontTypeArabic}';
  }

  factory LocalSettingModel.fromJson(Map<String, dynamic> json) => LocalSettingModel(
        quranType:
            json['quranType'] != null ? EQuranType.values[json['quranType']] : EQuranType.reading,
        readOptions: json['readOptions'] != null
            ? EReadOptions.values[json['readOptions']]
            : EReadOptions.surahAndTranslation,
        textScaleFactor: json['textScaleFactor'] ?? 1.2,
        textScaleFactorArabic: json['textScaleFactorArabic'] ?? 1.2,
        fontType: json['fontType'] ?? "Nunito",
        fontTypeArabic: json['fontTypeArabic'] ?? "Nunito",
      );

  Map<String, dynamic> toJson() => {
        'quranType': quranType.index,
        'readOptions': readOptions.index,
        'textScaleFactor': textScaleFactor,
        'textScaleFactorArabic': textScaleFactorArabic,
        'fontType': fontType,
        'fontTypeArabic': fontTypeArabic,
      };
}
