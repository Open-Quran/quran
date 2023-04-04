import '../constants/enums.dart';

class LocalSettingModel {
  EQuranType quranType;
  EReadOptions readOptions;
  ELayoutOptions layoutOptions;
  double textScaleFactor;
  int surahDetailsPageThemeIndex;
  String fontType = "Nunito";
  String fontTypeArabic = "Uthmani";

  LocalSettingModel({
    this.quranType = EQuranType.translation,
    this.layoutOptions = ELayoutOptions.justify,
    this.readOptions = EReadOptions.surahAndTranslation,
    this.textScaleFactor = 1.5,
    this.surahDetailsPageThemeIndex = 3,
    this.fontType = "Nunito",
    this.fontTypeArabic = "Uthmani",
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
            : ELayoutOptions.justify,
        textScaleFactor: json['textScaleFactor'] ?? 1.5,
        surahDetailsPageThemeIndex: json['mushafBackgroundColorIndex'] ?? 3,
        fontType: json['fontType'] ?? "Nunito",
        fontTypeArabic: json['fontTypeArabic'] ?? "Uthmani",
      );

  Map<String, dynamic> toJson() => {
        'quranType': quranType.index,
        'readOptions': readOptions.index,
        'layoutOptions': layoutOptions.index,
        'textScaleFactor': textScaleFactor,
        'mushafBackgroundColorIndex': surahDetailsPageThemeIndex,
        'fontType': fontType,
        'fontTypeArabic': fontTypeArabic,
      };
}
