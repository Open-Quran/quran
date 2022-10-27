import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/home_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/bars/custom_tab_bar.dart';
import 'package:fabrikod_quran/widgets/cards/juz_card.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:fabrikod_quran/widgets/bars/custom_search_bar.dart';
import 'package:fabrikod_quran/widgets/tags/custom_tag_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.watch<HomeProvider>().searchBarFocusNodeUnFocus,
      child: Scaffold(
        appBar: MainAppBar(title: context.translate.quran),
        body: buildBody,
      ),
    );
  }

  Widget get buildBody {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal) +
          const EdgeInsets.only(top: kPaddingVertical),
      child: Column(
        children: [
          buildBasmala,
          const SizedBox(height: kPaddingDefault * 2),
          buildSearchBar,
          const SizedBox(height: kPaddingDefault),
          buildSearchTags,
          const SizedBox(height: kPaddingDefault * 2),
          buildTabBar,
        ],
      ),
    );
  }

  /// Returns Basmala as a picture
  Widget get buildBasmala =>
      SvgPicture.asset(ImageConstants.bigBasmalaIcon, color: Theme.of(context).iconTheme.color);

  /// Search bar => [FocusNode]
  Widget get buildSearchBar =>
      CustomSearchBar(focusNode: context.watch<HomeProvider>().searchBarFocusNode);

  Widget get buildSearchTags {
    return CustomTagList(
      ///Todo After then Fixed
      tags: const ["Surah", "Juz", "Sajda", "Al-Fatiha", "Al-Fatiha", "Al-Fatiha"],
      selectedTag: (selectedTag) {},
    );
  }

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

  /// List of the Surah Verses
  Widget get buildSurahList {
    var surahs = context.watch<QuranProvider>().surahs;
    return ListView.separated(
      itemCount: surahs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kPaddingVertical),
      itemBuilder: (context, index) => SurahCard(
        surahModel: surahs[index],
        onTap: () => context.read<HomeProvider>().onTapSurahCard(index),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingContentSpaceBetween),
    );
  }

  /// The grid of the Juz list
  Widget get buildJuzList {
    return GridView.builder(
      itemCount: 30,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kPaddingVertical),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: kPaddingDefault * 2,
        crossAxisSpacing: kPaddingDefault * 2,
      ),
      itemBuilder: (context, index) => JuzCard(
        index: index,
        onTap: context.read<HomeProvider>().onTapJuzCard,
      ),
    );
  }

  /// List of the Sajda Verses
  Widget get buildSajdaList {
    var sajdas = context.watch<QuranProvider>().sajdaSurahs;
    return ListView.separated(
      itemCount: sajdas.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kPaddingVertical),
      itemBuilder: (context, index) => SurahCard(
        surahModel: sajdas[index],
        onTap: () => context.read<HomeProvider>().onTapSajdaCard(index),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingContentSpaceBetween),
    );
  }
}
