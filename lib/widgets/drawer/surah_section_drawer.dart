import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/widgets/drawer/search_section_drawer.dart';

import '../../models/surah_model.dart';
import '../../models/verse_model.dart';
import '../buttons/custom_button.dart';
import '../custom_space.dart';

class SurahSectionDrawer extends StatefulWidget {
  final List<SurahModel> surahs;
  final List<VerseModel> versesOfSelectedSurah;

  const SurahSectionDrawer(
      {Key? key, required this.surahs, required this.versesOfSelectedSurah})
      : super(key: key);

  @override
  State<SurahSectionDrawer> createState() => _SurahSectionDrawerState();
}

class _SurahSectionDrawerState extends State<SurahSectionDrawer> {
  String surahFilter = "";
  String verseFilter = "";

  void changeSurahFilter(String value) {
    surahFilter = value;
    setState(() {});
  }

  List<SurahModel> get surahs {
    if (surahFilter.isEmpty) return widget.surahs;

    List<SurahModel> newSurahs = [];
    for (var element in widget.surahs) {
      if (element.id.toString().contains(surahFilter) ||
          element.nameSimple!.contains(surahFilter) ||
          element.nameComplex!.contains(surahFilter) ||
          element.nameArabic!.contains(surahFilter) ||
          element.nameTranslated!.contains(surahFilter)) {
        newSurahs.add(element);
      }
    }
    return newSurahs;
  }

  void changeVerseFilter(String value) {
    verseFilter = value;
    setState(() {});
  }

  List<VerseModel> get verses {
    if (verseFilter.isEmpty) return widget.versesOfSelectedSurah;
    List<VerseModel> newVerses = [];
    for (var element in widget.versesOfSelectedSurah) {
      if (element.verseNumber.toString().contains(verseFilter)) {
        newVerses.add(element);
      }
    }
    return newVerses;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: buildSurahListBody),
        buildVerticalDivider,
        Expanded(child: buildVerseListBody),
      ],
    );
  }

  Widget get buildSurahListBody {
    return Column(
      children: [
        buildSurahSearch,
        CustomSpace.normal(),
        Expanded(child: buildSurahList),
      ],
    );
  }

  Widget get buildSurahSearch {
    return SearchSectionDrawer(
      hintText: context.translate.searchSurah,
      onChanged: changeSurahFilter,
    );
  }

  Widget get buildSurahList {
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        var surah = surahs[index];
        return CustomButton(
          title: "${surah.id}  ${surah.nameComplex}",
          centerTitle: false,
          height: 45,
          onTap: () {
            // context.read<SurahDetailsProvider>().changeSurahIndex(surah.id! - 1);
            Utils.unFocus();
          },
        );
      },
    );
  }

  Widget get buildVerticalDivider {
    return VerticalDivider(
      color: context.theme.dividerColor,
      width: kSizeXL * 2,
      thickness: 2,
    );
  }

  Widget get buildVerseListBody {
    return Column(
      children: [
        buildVerseSearch,
        CustomSpace.normal(),
        Expanded(child: buildVerseList),
      ],
    );
  }

  Widget get buildVerseList {
    return ListView.builder(
      itemCount: verses.length,
      itemBuilder: (context, index) {
        var number = verses[index].verseNumber;
        return CustomButton(
          title: "$number",
          centerTitle: false,
          height: 45,
          onTap: () {
            // context.read<SurahDetailsProvider>().changeSurahVerseIndex(number! - 1);
            // Utils.unFocus();
          },
        );
      },
    );
  }

  Widget get buildVerseSearch {
    return SearchSectionDrawer(
      hintText: context.translate.ayat,
      onChanged: changeVerseFilter,
    );
  }
}
