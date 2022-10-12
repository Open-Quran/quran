class SurahModel {
  int id;
  String name;
  String nameAr;

  int get versesLength => 100;

  SurahModel({required this.id, required this.name, required this.nameAr});

  static List<SurahModel> get getFakeData {
    List<SurahModel> data = [];
    for (int i = 0; i < 10; i++) {
      data.add(SurahModel(id: i, name: "Al-Fatihah", nameAr: "ٱلْفَاتِحَة"));
    }
    return data;
  }
}
