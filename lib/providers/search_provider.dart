import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/enums.dart';
import '../managers/surah_detail_navigation_manager.dart';
import '../models/surah_model.dart';
import '../models/translation.dart';
import '../models/verse_model.dart';
import '../utils/utils.dart';
import '../widgets/tags/custom_tag_list.dart';
import 'quran_provider.dart';

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

  /// The list of the [VerseModel]
  List<VerseModel> filteredVerseSearch = [];

  /// The list of the [VerseTranslation]
  List<VerseTranslation> filteredVerseTranslationSearch = [];

  /// Storing search query, initially empty
  String query = '';

  /// Checks if search field is empty
  bool isFieldEmpty = true;

  /// Checks if search field is empty
  bool isSearchButtonTapped = false;

  /// Storing page number, initially null
  int? filterPageNumber;

  /// Storing juz number, initially null
  int? filterJuzNumber;

  /// Enum toggle search options
  EToggleSearchOptions toggleSearchOptions = EToggleSearchOptions.toggles;

  /// Juz List Type [EJuzListType]
  EJuzListType juzListType = EJuzListType.list;

  /// Surah Details page - juz and surah toggle buttons
  EJuzSurahToggleOptions juzSurahToggleOptionType = EJuzSurahToggleOptions.juz;

  /// OnTap search
  void handleSearchSubmitted(String query) {
    this.query = query;
    onSearchFieldChanged();
  }

  /// List of tags under the search
  Widget get buildSearchTags {
    return CustomTagList(
      tags: const [
        "Al-Fatiha",
        "Al-Mulk",
        "Ya-sin",
        "Al-Kahf",
        "Maryam",
      ],
      selectedTag: selectedTag,
    );
  }

  /// Checking if search field is empty
  onSearchFieldChanged() {
    if (query != "") {
      isFieldEmpty = false;
      filterSurahSearchResults(query);
      filterByPageAndJuzNumber(query);
      // filterSurahVerse(query);
      // filterSurahVerseTranslation(query);
      isSearchButtonTapped = true;
    } else {
      isFieldEmpty = true;
    }
    notifyListeners();
  }

  // /// Getting search result by surah name, id etc.
  // /// [VerseModel]
  // filterSurahVerseTranslation(String queryText) {
  //   queryText = queryText.toLowerCase();
  //   List<VerseTranslation> searchList =
  //       _context.read<QuranProvider>().translationService.getAllVerseTranslations;
  //   List<VerseTranslation> searchResult = [];
  //   for (var verse in searchList) {
  //     if (verse.text!.toLowerCase().contains(queryText)) {
  //       searchResult.add(verse);
  //     }
  //   }
  //   filteredVerseTranslationSearch.clear();
  //   filteredVerseTranslationSearch.addAll(searchResult);
  //   notifyListeners();
  // }

  /// Getting search result by surah name, id etc.
  /// [VerseModel]
  filterSurahVerse(String queryText) {
    queryText = queryText.toLowerCase();
    List<VerseModel> searchList = _context.read<QuranProvider>().getAllVerses;
    List<SurahModel> searchListSurah = _context.read<QuranProvider>().surahs;
    List<VerseModel> searchResult = [];
    for (var verse in searchList) {
      if (verse.text!.toLowerCase().contains(queryText) ||
          searchListSurah[verse.surahId! - 1].nameTranslated!.toLowerCase().contains(queryText)) {
        if (searchListSurah[verse.surahId! - 1].id == (verse.surahId!)) {
          verse.surahNameTranslated = searchListSurah[verse.surahId! - 1].nameSimple;
          verse.surahNameArabic = searchListSurah[verse.surahId! - 1].nameArabic;
        }
        searchResult.add(verse);
      }
    }
    filteredVerseSearch = [];
    filteredVerseSearch.addAll(searchResult);
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

  selectedTag(String selectedTag) {
    textEditingController.text = selectedTag;
    searchBarFocusNode.requestFocus();
  }

  /// If search bar is not empty, clear textField
  /// If search bar empty, show toggle buttons
  clearSearchField(BuildContext context) {
    if (textEditingController.text.isNotEmpty) {
      textEditingController.clear();
      filterPageNumber = null;
      filterJuzNumber = null;
      filteredSurahSearch = [];
      filteredVerseSearch = [];
      searchBarFocusNode.requestFocus();
      isSearchButtonTapped = false;
      notifyListeners();
    } else {
      Utils.unFocus();
      changeToggleSearchOptions(EToggleSearchOptions.toggles);
    }
  }

  /// Changing between toggle buttons and search bar
  changeToggleSearchOptions(EToggleSearchOptions newOptionType) {
    toggleSearchOptions = newOptionType;
    notifyListeners();
  }

  /// Checking when search result is empty
  get isSearchResultEmpty {
    return (filteredVerseSearch.isEmpty &&
            filteredSurahSearch.isEmpty &&
            filterPageNumber == null &&
            filterJuzNumber == null) &&
        isSearchButtonTapped;
  }

  /// Checking when search item is displayed
  get isSearchResultDisplayed {
    return filteredVerseSearch.isNotEmpty ||
        filteredSurahSearch.isNotEmpty ||
        filterPageNumber != null ||
        filterJuzNumber != null;
  }

  Future<void> goToSurah(BuildContext context, int surahId, bool isHome, {int verseId = 1}) async {
    if (!isHome) Navigator.pop(context);
    await SurahDetailNavigationManager.goToSurah(context, surahId, verseId: verseId);
    notifyListeners();
  }

  Future<void> goToJuz(BuildContext context, int juzId, bool isHome) async {
    if (!isHome) Navigator.pop(context);
    await SurahDetailNavigationManager.goToJuz(context, juzId);
    notifyListeners();
  }

  Future<void> goToMushaf(BuildContext context, int pageNumber, bool isHome) async {
    if (!isHome) Navigator.pop(context);
    await SurahDetailNavigationManager.goToMushaf(context, pageNumber);
    notifyListeners();
  }

  /// Change list type in [HomeScreen]
  /// Grid view or list view
  changeJuzListType(EJuzListType newListType) {
    juzListType = newListType;
    notifyListeners();
  }

  /// Change type juz, surah or search
  changeJuzOrSurahToggleOptionType(EJuzSurahToggleOptions newOptionType) {
    juzSurahToggleOptionType = newOptionType;
    notifyListeners();
  }
}
