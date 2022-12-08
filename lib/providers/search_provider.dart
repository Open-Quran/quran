import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/reading_settings_model.dart';
import '../screens/surah_details/surah_details_screen.dart';
import '../utils/utils.dart';

class SearchProvider extends ChangeNotifier {
  /// Class constructor
  SearchProvider(this._context);

  /// Text controller
  TextEditingController textEditingController = TextEditingController();

  /// Focus node for search field in the home screen
  late FocusNode searchBarFocusNode = FocusNode();

  /// [BuildContext] of the page
  final BuildContext _context;

  /// The list of the [SurahModel]
  List<SurahModel> filteredSurahSearch = [];

  /// Storing search query, initially empty
  String query = '';

  /// Checks if search field is empty
  bool isFieldEmpty = true;

  /// Storing page number, initially null
  int? filterPageNumber;

  /// Storing juz number, initially null
  int? filterJuzNumber;

  /// OnTap search
  void handleSearchSubmitted(String query) {
    this.query = query;
    onSearchFieldChanged();
  }

  /// Checking if search field is empty
  onSearchFieldChanged() {
    if (query != "") {
      isFieldEmpty = false;
      filterSurahSearchResults(query);
      filterByPageAndJuzNumber(query);
    } else {
      isFieldEmpty = true;
    }
    notifyListeners();
  }

  /// Getting search result by surah name, id etc.
  /// [SurahModel]
  filterSurahSearchResults(String queryText) {
    queryText = queryText.toLowerCase();
    List<SurahModel> searchList = _context.read<QuranProvider>().surahs;
    List<SurahModel> searchResult = [];
    for (var surah in searchList) {
      if (surah.nameTranslated!.toLowerCase().contains(queryText) ||
          surah.nameSimple!.toLowerCase().contains(queryText) ||
          surah.nameArabic!.toLowerCase().contains(queryText) ||
          surah.nameComplex!.toLowerCase().contains(queryText) ||
          surah.revelationPlace!.toLowerCase().contains(queryText) ||
          surah.id.toString() == queryText) {
        searchResult.add(surah);
      }
    }

    filteredSurahSearch.clear();
    filteredSurahSearch.addAll(searchResult);
    notifyListeners();
  }

  /// Getting search result by page number or juz number
  filterByPageAndJuzNumber(String queryText) {
    filterPageNumber = null;
    filterJuzNumber = null;
    if (Utils.isNumeric(queryText) && int.parse(queryText) <= 604) {
      filterJuzNumber = int.parse(queryText);
      filterPageNumber = int.parse(queryText);
      if (filterJuzNumber! > 30) {
        filterJuzNumber = null;
      }
    }
  }

  /// Navigation to the specific page
  void onTapSearchPageCard(int pageIndex) {
    _context.read<QuranProvider>().changeQuranType(1);
    var model = ReadingSettingsModel(mushafPageNumber: filterPageNumber!);
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SurahDetailsProvider(context, model),
          child: const SurahDetailsScreen(),
        ),
      ),
    );
  }

  selectedTag(String selectedTag) {
    textEditingController.text = selectedTag;
    searchBarFocusNode.requestFocus();
  }
}
