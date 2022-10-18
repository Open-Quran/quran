class AyatModel {
  int id;
  String ayat;
  String ayatTranslation;

  int get versesLength => 100;

  AyatModel(
      {required this.id, required this.ayat, required this.ayatTranslation});

  static List<AyatModel> get getTestData {
    List<AyatModel> data = [];
    for (int i = 0; i < 10; i++) {
      data.add(
        AyatModel(
          id: i,
          ayat: "بسم الله الرحمن الرحیم",
          ayatTranslation:
              "In the name of Allah, the Entirely Merciful, the Especially Merciful.",
        ),
      );
    }
    return data;
  }
}
