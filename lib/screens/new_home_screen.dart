import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/home_provider.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/juz_category_list_widget.dart';
import 'package:fabrikod_quran/widgets/cards/surah_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: buildJuzCategoryList(context),
        ),
      ),
    );
  }

  /// List of The Juz Category
  Widget buildJuzCategoryList(BuildContext context) {
    return JuzCategoryListWidget(
      juzList: context.watch<QuranProvider>().juzList,
      listType: context.watch<HomeProvider>().juzListType,
      onChangedListType: context.read<HomeProvider>().changeJuzListType,
      onTapGridCard: (int juzId) {
        print("On Tap Juz Card : $juzId");
      },
      onTapSurahCard: (int surahId) {
        print("On Tap Surah Card : $surahId");
      },
    );
  }

  /// List of the Surah Verses
  Widget buildSurahList(BuildContext context) {
    var surahs = context.watch<QuranProvider>().surahs;
    return ListView.separated(
      itemCount: surahs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return SurahCard(
          surahModel: surah,
          onTap: () {
            print("On Tap Surah Card : ${surah.id}");
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingL),
    );
  }
}
