import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/providers/home_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:fabrikod_quran/widgets/app_bars/secondary_app_bar.dart';
import 'package:fabrikod_quran/widgets/bars/custom_tab_bar.dart';
import 'package:fabrikod_quran/widgets/cards/grid_card.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:fabrikod_quran/widgets/bars/custom_search_bar.dart';
import 'package:fabrikod_quran/widgets/no_item_widget.dart';
import 'package:fabrikod_quran/widgets/tags/custom_tag_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/cards/search_card.dart';
import '../widgets/cards/search_surah_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(_),
      child: const _MyHomeScreen(),
    );
  }
}

class _MyHomeScreen extends StatefulWidget {
  const _MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<_MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<_MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Utils.unFocus,
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: context.translate.theOpenQuran,
        ),
        body: buildBody,
      ),
    );
  }

  Widget get buildBody {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingXL) +
          const EdgeInsets.only(top: kPaddingXXL),
      child: Column(
        children: [
          buildBasmala,
          const SizedBox(height: kPaddingM * 2),
          buildSearchBar,
          const SizedBox(height: kPaddingM),
          buildSearchTags,
          const SizedBox(height: kPaddingM * 2),
          RepaintBoundary(
            child: context.watch<SearchProvider>().isFieldEmpty
                ? buildTabBar
                : buildSurahFilterList,
          ),
        ],
      ),
    );
  }

  /// Returns Basmala Title
  Widget get buildBasmala => SvgPicture.asset(ImageConstants.bigBasmalaIcon,
      color: Theme.of(context).iconTheme.color);

  /// Search bar => [FocusNode]
  Widget get buildSearchBar => CustomSearchBar(
        textEditingController:
            context.read<SearchProvider>().textEditingController,
        focusNode: context.read<SearchProvider>().searchBarFocusNode,
        onSubmit: context.read<SearchProvider>().handleSearchSubmitted,
      );

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
      selectedTag: context.read<SearchProvider>().selectedTag,
    );
  }

  /// Tab bar in [HomeScreen]
  Widget get buildTabBar {
    return CustomTabBar(
      tabTitles: [
        context.translate.surah,
        context.translate.juz,
        context.translate.sajda,
      ],
      tabViews: [
        buildSurahList,
        buildJuzList,
        buildSajdaList,
      ],
    );
  }

  Widget get buildSurahFilterList {
    /// Getting list of surahs
    var searchSurahResult = context.watch<SearchProvider>().filteredSurahSearch;

    /// Getting page number
    var pageNumber = context.watch<SearchProvider>().filterPageNumber;

    /// Getting juz number
    var juzNumber = context.watch<SearchProvider>().filterJuzNumber;

    return searchSurahResult.isEmpty && pageNumber == null
        ? NoItemWidget(
            text: context.translate.noResultsFound,
            icon: const Icon(
              Icons.search_off,
              size: 30,
            ))
        : Column(
            children: [
              Visibility(
                visible: searchSurahResult.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: kPaddingM, bottom: kPaddingM),
                      child: buildSurahLabel(),
                    ),
                    buildSurahSearchResult(searchSurahResult),
                  ],
                ),
              ),
              buildJuzAndPageSearchResult(pageNumber, juzNumber),
            ],
          );
  }

  /// Surah label
  Text buildSurahLabel() {
    return Text(
      context.translate.surahs,
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.headlineSmall,
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
            .onTapSurahCard(searchSurahResult[index].id! - 1),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingL),
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
          child: SearchCard(
            title: context.translate.juz,
            titleNumber: "${context.translate.juz} - $pageNumber",
            onTap: () {
              context.read<HomeProvider>().onTapJuzCard(juzNumber! - 1);
            },
          ),
        ),
        Visibility(
          visible: pageNumber != null,
          child: SearchCard(
            title: context.translate.page,
            titleNumber: "${context.translate.page} - $pageNumber",
            onTap: () {
              context.read<SearchProvider>().onTapSearchPageCard(pageNumber!);
            },
          ),
        ),
      ],
    );
  }

  /// List of the Surah Verses
  Widget get buildSurahList {
    var surahs = context.watch<QuranProvider>().surahs;
    return ListView.separated(
      itemCount: surahs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kPaddingXXL),
      itemBuilder: (context, index) => SurahCard(
        surahModel: surahs[index],
        onTap: () =>
            context.read<HomeProvider>().onTapSurahCard(surahs[index].id! - 1),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingL),
    );
  }

  /// The grid of the Juz list
  Widget get buildJuzList {
    return GridView.builder(
      itemCount: 30,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kPaddingXXL),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: kPaddingM * 2,
        crossAxisSpacing: kPaddingM * 2,
      ),
      itemBuilder: (context, index) => GridCard(
          text: "${index + 1}",
          onTap: () {
            context.read<HomeProvider>().onTapJuzCard(index);
          }),
    );
  }

  /// List of the Sajda Verses
  Widget get buildSajdaList {
    var sajdas = context.watch<QuranProvider>().sajdaSurahs;
    return ListView.separated(
      itemCount: sajdas.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kPaddingXXL),
      itemBuilder: (context, index) => SurahCard(
        surahModel: sajdas[index],
        onTap: () => context.read<HomeProvider>().onTapSajdaCard(index),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingL),
    );
  }
}
