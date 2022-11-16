import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/models/verse_translation.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/services/asset_quran_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  SearchProvider(this._context);

  final BuildContext _context;

  String query = '';
  List<SurahModel> filteredSearch = [];
  bool isFieldEmpty = true;

  void handleSearchSubmitted(String query) {
    this.query = query;
    onSearchFieldChanged();
  }

  void onSearchFieldChanged() {
    if (query != "") {
      isFieldEmpty = false;
      filterSearchResults(query);
    } else {
      isFieldEmpty = true;
    }
    notifyListeners();
  }

  Future<void> initSurahListView() async {
    filteredSearch = await AssetQuranService.getAllOfSurahs();
    notifyListeners();
  }

  filterSearchResults(String queryText) {
    queryText = queryText.toLowerCase();
    List<SurahModel> searchList = _context.read<QuranProvider>().surahs;
    List<SurahModel> searchResult = [];
    List<VerseModel> filteredVerseList = [];
    notifyListeners();

    for (var surah in searchList) {
      var verseList = surah.verses;
      if (surah.nameTranslated!.toLowerCase().contains(queryText) ||
          surah.nameSimple!.toLowerCase().contains(queryText) ||
          surah.nameArabic!.toLowerCase().contains(queryText) ||
          surah.nameComplex!.toLowerCase().contains(queryText) ||
          surah.id.toString().contains(queryText)) {

        for (var verse in verseList) {
            if (verse.pageNumber.toString().contains(queryText) ||
                verse.text!.contains(queryText) ||
                verse.verseNumber.toString().contains(queryText)) {
              filteredVerseList.add(verse);

        }
        searchResult.add(surah);
      }
    }}

    filteredSearch.clear();
    filteredSearch.addAll(searchResult);
    notifyListeners();
  }
}
