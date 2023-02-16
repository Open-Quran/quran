import 'package:fabrikod_quran/constants/constants.dart';

class LocalSettingModel {
  EQuranType quranType;
  EReadOptions readOptions;
  ELayoutOptions layoutOptions;
  double textScaleFactor;
  int mushafBackgroundColorIndex;
  String fontType = Fonts.translationFontNames.first;
  String fontTypeArabic = Fonts.arabicFontNames.first;

  LocalSettingModel({
    this.quranType = EQuranType.translation,
    this.layoutOptions = ELayoutOptions.center,
    this.readOptions = EReadOptions.surahAndTranslation,
    this.textScaleFactor = 1.2,
    this.mushafBackgroundColorIndex = 0,
    this.fontType = "Nunito",
    this.fontTypeArabic = "Nunito",
  });

  @override
  String toString() {
    return 'LocalSettingModel{quranType: $quranType, readOptions: $readOptions, layoutOptions: $layoutOptions, textScaleFactor: $textScaleFactor, fontType: $fontType, fontTypeArabic: $fontTypeArabic}';
  }

  factory LocalSettingModel.fromJson(Map<String, dynamic> json) =>
      LocalSettingModel(
        quranType: json['quranType'] != null
            ? EQuranType.values[json['quranType']]
            : EQuranType.translation,
        readOptions: json['readOptions'] != null
            ? EReadOptions.values[json['readOptions']]
            : EReadOptions.surahAndTranslation,
        layoutOptions: json['layoutOptions'] != null
            ? ELayoutOptions.values[json['layoutOptions']]
            : ELayoutOptions.center,
        textScaleFactor: json['textScaleFactor'] ?? 1.2,
        mushafBackgroundColorIndex: json['mushafBackgroundColorIndex'] ?? 0,
        fontType: json['fontType'] ?? "Nunito",
        fontTypeArabic: json['fontTypeArabic'] ?? "Nunito",
      );

  Map<String, dynamic> toJson() => {
        'quranType': quranType.index,
        'readOptions': readOptions.index,
        'layoutOptions': layoutOptions.index,
        'textScaleFactor': textScaleFactor,
        'mushafBackgroundColorIndex': mushafBackgroundColorIndex,
        'fontType': fontType,
        'fontTypeArabic': fontTypeArabic,
      };
}
