import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/screens/search_result_screen.dart';

import '../database/local_db.dart';
import '../providers/home_provider.dart';
import '../providers/search_provider.dart';
import '../widgets/animation/fade_indexed_stack.dart';
import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/buttons/juz_surah_search_toggle_button.dart';
import '../widgets/cards/recent_card.dart';
import '../widgets/lists/juz_list.dart';
import '../widgets/lists/surah_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              JuzSurahSearchToggleButton(
                toggleSearchButtonIndex: context.read<SearchProvider>().toggleSearchOptions.index,
                onChanged: context.watch<HomeProvider>().changeJuzOrSurahToggleOptionType,
                onTapSearchButton: context.read<SearchProvider>().changeToggleSearchOptions,
                toggleListType: context.watch<HomeProvider>().juzSurahToggleOptionType,
              ),
              FadeIndexedStack(
                index: context.watch<SearchProvider>().toggleSearchOptions.index,
                children: [
                  buildToggleSearchPages(context),
                  const SearchResultScreen(isHome: true),
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
      index: context.watch<HomeProvider>().juzSurahToggleOptionType.index,
      children: [
        buildRecentAndJuzCategoryList(),
        SurahList(onTap: (surahId) {
          context.read<SearchProvider>().goToSurah(context, surahId, true);
        }),
      ],
    );
  }

  /// Recent visited Surah, Juz or Page
  Widget buildRecentAndJuzCategoryList() {
    return Column(
      children: [
        buildRecent(),
        JuzList(
          changeListType: context.read<HomeProvider>().changeJuzListType,
          juzListType: context.watch<HomeProvider>().juzListType,
          onTapJuzCard: (juzId) {
            context.read<SearchProvider>().goToJuz(context, juzId, true);
          },
          onTapSurahCard: (surahId) {
            context.read<SearchProvider>().goToSurah(context, surahId, true);
          },
        )
      ],
    );
  }

  /// Build recent visited paged
  Widget buildRecent() {
    var reversedList = LocalDb.getRecents.reversed.take(8).toList();
    return Visibility(
      visible: LocalDb.getRecents.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kSizeL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSizeL),
              child: Text(
                context.translate.recent,
                style: context.theme.textTheme.displayLarge?.copyWith(letterSpacing: 0.04),
              ),
            ),
            const SizedBox(height: kSizeL),
            SizedBox(
              height: 90,
              child: GridView.builder(
                itemCount: reversedList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: kSizeM),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: kSizeS,
                ),
                itemBuilder: (context, index) {
                  return RecentCard(
                    text: reversedList[index].name(context),
                    onTap: () {
                      reversedList[index].navigationToSurahDetails(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
