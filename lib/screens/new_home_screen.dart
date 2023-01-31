import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/home_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/home_toggle_button.dart';
import 'package:fabrikod_quran/widgets/cards/grid_card.dart';
import 'package:fabrikod_quran/widgets/juz_category_list_widget.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:fabrikod_quran/widgets/juz_surah_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/animation/fade_indexed_stack.dart';
import '../widgets/app_bars/primary_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                index: context.watch<HomeProvider>().homeToggleOptionType.index,
                children: [
                  buildRecentAndJuzCategoryList(),
                  buildSurahList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
          child: Text(
            context.translate.resent,
            style: context.theme.textTheme.displayLarge
                ?.copyWith(letterSpacing: 0.04),
          ),
        ),
        const SizedBox(height: kPaddingL),
        SizedBox(
          height: 90,
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: kPaddingS,
            ),
            itemBuilder: (context, index) {
              return GridCard(
                text: index.toString(),
                onTap: () {},
              );
            },
          ),
        ),
        const SizedBox(height: kPaddingXL),
      ],
    );
  }

  /// List of The Juz Category
  Widget buildJuzCategoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: JuzCategoryListWidget(
        juzList: context.watch<QuranProvider>().juzList,
        listType: context.watch<HomeProvider>().juzListType,
        onChangedListType: context.read<HomeProvider>().changeJuzListType,
        onTapGridCard: (int juzId) {
          context.read<HomeProvider>().onTapJuzCard(juzId - 1);
          print("On Tap Juz Card : $juzId");
        },
        onTapSurahCard: (int surahId) {
          context.read<HomeProvider>().onTapSurahCard(surahId - 1);
          print("On Tap Surah Card : $surahId");
        },
      ),
    );
  }

  /// List of the Surah Verses
  Widget buildSurahList() {
    var surahs = context.watch<QuranProvider>().surahs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: ListView.separated(
        itemCount: surahs.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return SurahCard(
            surahModel: surah,
            onTap: () {
              context.read<HomeProvider>().onTapSurahCard(surah.id! - 1);
              print("On Tap Surah Card : ${surah.id}");
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: kPaddingL),
      ),
    );
  }
}
