import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/home_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/home_toggle_button.dart';
import 'package:fabrikod_quran/widgets/cards/grid_card.dart';
import 'package:fabrikod_quran/widgets/cards/search_verse_card.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:fabrikod_quran/widgets/juz_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/surah_model.dart';
import '../providers/search_provider.dart';
import '../widgets/animation/fade_indexed_stack.dart';
import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/cards/search_card.dart';
import '../widgets/cards/search_navigation_card.dart';
import '../widgets/cards/search_surah_card.dart';
import '../widgets/cards/search_verse_translations_card.dart';
import '../widgets/no_item_widget.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Utils.unFocus,
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: context.translate.theOpenQuran,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeToggleButton(
                onChanged:
                    context.watch<HomeProvider>().changeHomeToggleOptionType,
                toggleListType:
                    context.watch<HomeProvider>().homeToggleOptionType,
              ),
              FadeIndexedStack(
                index: context.watch<HomeProvider>().toggleSearchOptions.index,
                children: [
                  buildToggleSearchPages(context),
                  buildSearchResults(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Juz/Translation and Search pages
  FadeIndexedStack buildToggleSearchPages(BuildContext context) {
    return FadeIndexedStack(
      index: context.watch<HomeProvider>().homeToggleOptionType.index,
      children: [
        buildRecentAndJuzCategoryList(),
        buildSurahList(),
      ],
    );
  }

  /// [VerseTranslation] search results
  ListView buildVerseTranslationSearchResult(
      List<VerseTranslation> searchVerseTranslationResult) {
    return ListView.separated(
      itemCount: searchVerseTranslationResult.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (context, index) => SearchVerseTranslationCard(
          verseTranslationModel: searchVerseTranslationResult[index],
          onTap: () {}),
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
        onTap: () => context
            .read<HomeProvider>()
            .onTapSurahCard(searchVerseResult[index].id!),
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
        onTap: () => context
            .read<HomeProvider>()
            .onTapSurahCard(searchSurahResult[index].id!),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }

  ListView buildSurahSearchResult2(List<SurahModel> searchSurahResult) {
    return ListView.separated(
      itemCount: searchSurahResult.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SearchCard(
        surahModel: searchSurahResult[index],
        onTap: () => context
            .read<HomeProvider>()
            .onTapSurahCard(searchSurahResult[index].id!),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }

  /// [Juz] and [Page] search results
  ListView buildJuzAndPageSearchResult(int? pageNumber, int? juzNumber) {
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
              context.read<HomeProvider>().onTapJuzCard(juzNumber!);
            },
          ),
        ),
        Visibility(
          visible: pageNumber != null,
          child: SearchNavigationCard(
            title: context.translate.page,
            titleNumber: "${context.translate.page} $pageNumber",
            onTap: () {
              context.read<SearchProvider>().onTapSearchPageCard();
            },
          ),
        ),
      ],
    );
  }

  /// Displaying search result
  Widget buildSearchResults() {
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
                  buildJuzAndPageSearchResult(searchProvider.filterPageNumber,
                      searchProvider.filterJuzNumber),
                  buildSurahSearchResult(searchProvider.filteredSurahSearch),

                  /// Can be used later on
                  // buildVerseSearchResult(searchProvider.filteredVerseSearch),
                  // buildVerseTranslationSearchResult(searchProvider.filteredVerseTranslationSearch),
                  const SizedBox(
                    height: kSizeXXL,
                  ),
                  // Text(
                  //   context.translate.search,
                  //   style: context.theme.textTheme.bodySmall,
                  // ),
                  // buildSurahSearchResult2(searchSurahResult),
                ],
              ),
      );
    });
  }

  /// Recent visited Surah, Juz or Page
  Widget buildRecentAndJuzCategoryList() {
    return Column(
      children: [
        buildResent(),
        buildJuzCategoryList(),
      ],
    );
  }

  /// Build Resent
  Widget buildResent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeL),
          child: Text(
            context.translate.recent,
            style: context.theme.textTheme.displayLarge
                ?.copyWith(letterSpacing: 0.04),
          ),
        ),
        const SizedBox(height: kSizeL),
        SizedBox(
          height: 90,
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: kSizeM),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: kSizeS,
            ),
            itemBuilder: (context, index) {
              return GridCard(
                text: index.toString(),
                onTap: () {},
              );
            },
          ),
        ),
        const SizedBox(height: kSizeXL),
      ],
    );
  }

  /// List of The Juz Category
  Widget buildJuzCategoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSizeL),
      child: JuzCategoryListWidget(
        juzList: context.watch<QuranProvider>().juzList,
        listType: context.watch<HomeProvider>().juzListType,
        onChangedListType: context.read<HomeProvider>().changeJuzListType,
        onTapGridCard: (int juzId) {
          context.read<HomeProvider>().onTapJuzCard(juzId);
          print("On Tap Juz Card : $juzId");
        },
        onTapSurahCard: (int surahId) {
          context.read<HomeProvider>().onTapSurahCard(surahId);
          print("On Tap Surah Card : $surahId");
        },
      ),
    );
  }

  /// List of the Surah Verses
  Widget buildSurahList() {
    var surahs = context.watch<QuranProvider>().surahs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSizeL),
      child: ListView.separated(
        itemCount: surahs.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return SurahCard(
            surahModel: surah,
            onTap: () {
              context.read<HomeProvider>().onTapSurahCard(surah.id!);
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
      ),
    );
  }
}
