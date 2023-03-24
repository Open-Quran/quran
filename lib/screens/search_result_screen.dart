import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../models/surah_model.dart';
import '../models/translation.dart';
import '../models/verse_model.dart';
import '../providers/search_provider.dart';
import '../widgets/cards/search_navigation_card.dart';
import '../widgets/cards/search_surah_card.dart';
import '../widgets/cards/search_verse_card.dart';
import '../widgets/cards/search_verse_translations_card.dart';
import '../widgets/no_item_widget.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key, required this.isHome}) : super(key: key);

  /// Checking is navigation from home screen
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, searchProvider, child) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(kSizeXL, 0, kSizeXL, kSizeXL),
        child: searchProvider.isSearchResultEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: NoItemWidget(
                  text: context.translate.noResultsFound,
                  icon: SvgPicture.asset(
                    ImageConstants.searchIcon,
                    width: 45,
                    height: 55,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: searchProvider.isSearchResultDisplayed,
                    child: Padding(
                      padding: const EdgeInsets.only(top: kSizeL),
                      child: Text(
                        context.translate.navigation,
                        style: context.theme.textTheme.titleLarge,
                      ),
                    ),
                  ),
                  buildJuzAndPageSearchResult(context, searchProvider.filterPageNumber, searchProvider.filterJuzNumber),
                  buildSurahSearchResult(searchProvider.filteredSurahSearch),

                  /// Can be used later on
                  // buildVerseSearchResult(searchProvider.filteredVerseSearch),
                  // buildVerseTranslationSearchResult(searchProvider.filteredVerseTranslationSearch),
                  const SizedBox(height: kSizeXXL),
                ],
              ),
      );
    });
  }

  /// [VerseTranslation] search results
  ListView buildVerseTranslationSearchResult(List<VerseTranslation> searchVerseTranslationResult) {
    return ListView.separated(
      itemCount: searchVerseTranslationResult.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (context, index) =>
          SearchVerseTranslationCard(verseTranslationModel: searchVerseTranslationResult[index], onTap: () {}),
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }

  /// [Verse] search results
  ListView buildVerseSearchResult(List<VerseModel> searchVerseResult) {
    return ListView.separated(
      itemCount: searchVerseResult.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (context, index) => SearchVerseCard(
        verseModel: searchVerseResult[index],
        onTap: () {
          var verse = searchVerseResult[index];
          context.read<SearchProvider>().goToSurah(context, verse.surahId!, isHome, verseId: verse.verseNumber!);
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }

  /// [Surah] search results
  ListView buildSurahSearchResult(List<SurahModel> searchSurahResult) {
    return ListView.separated(
      itemCount: searchSurahResult.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (context, index) => SearchSurahCard(
        surahModel: searchSurahResult[index],
        onTap: () {
          context.read<SearchProvider>().goToSurah(context, searchSurahResult[index].id!, isHome);
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }

  /// [Juz] and [Page] search results
  ListView buildJuzAndPageSearchResult(BuildContext context, int? pageNumber, int? juzNumber) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Visibility(
          visible: juzNumber != null,
          child: SearchNavigationCard(
            title: context.translate.juz,
            titleNumber: "${context.translate.juz} $pageNumber",
            onTap: () {
              context.read<SearchProvider>().goToJuz(context, juzNumber ?? 1, isHome);
            },
          ),
        ),
        Visibility(
          visible: pageNumber != null,
          child: SearchNavigationCard(
            title: context.translate.page,
            titleNumber: "${context.translate.page} $pageNumber",
            onTap: () {
              context.read<SearchProvider>().goToMushaf(context, pageNumber ?? 1, isHome);
            },
          ),
        ),
      ],
    );
  }
}
