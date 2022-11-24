import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/custom_space.dart';
import 'package:fabrikod_quran/widgets/drawer/search_section_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahSectionDrawer extends StatefulWidget {
  final List<SurahModel> surahs;
  final List<VerseModel> versesOfSelectedSurah;

  const SurahSectionDrawer({Key? key, required this.surahs, required this.versesOfSelectedSurah})
      : super(key: key);

  @override
  State<SurahSectionDrawer> createState() => _SurahSectionDrawerState();
}

class _SurahSectionDrawerState extends State<SurahSectionDrawer> {
  late List<SurahModel> surahs;
  late List<VerseModel> versesOfSelectedSurah;

  @override
  void initState() {
    super.initState();
    surahs = widget.surahs;
    versesOfSelectedSurah = widget.versesOfSelectedSurah;
  }

  void onChangedSurah(String value) {
    if (value.isEmpty) {
      surahs = widget.surahs;
    } else {
      List<SurahModel> newSurahs = [];
      for (var element in widget.surahs) {
        if (element.id.toString().contains(value) ||
            element.nameSimple!.contains(value) ||
            element.nameComplex!.contains(value) ||
            element.nameArabic!.contains(value) ||
            element.nameTranslated!.contains(value)) {
          newSurahs.add(element);
        }
      }
      surahs = newSurahs;
    }
    setState(() {});
  }

  void onChangedVerse(String value) {
    if (value.isEmpty) {
      versesOfSelectedSurah = widget.versesOfSelectedSurah;
    } else {
      List<VerseModel> newVerses = [];
      for (var element in widget.versesOfSelectedSurah) {
        if (element.verseNumber.toString().contains(value)) {
          newVerses.add(element);
        }
      }
      versesOfSelectedSurah = newVerses;
    }
    setState(() {});
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
      onChanged: onChangedSurah,
    );
  }

  Widget get buildSurahList {
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        var surah = surahs[index];
        return CustomButton(
          title: "${surah.id}  ${surah.nameComplex}",
          state: context.watch<SurahDetailsProvider>().readingSettings.surahIndex == index,
          centerTitle: false,
          height: 45,
          onTap: () {
            context.read<SurahDetailsProvider>().changeSurahIndex(surah.id! - 1);
            Utils.unFocus(context);
          },
        );
      },
    );
  }

  Widget get buildVerticalDivider {
    return VerticalDivider(
      color: context.theme.dividerColor,
      width: kPaddingHorizontal * 2,
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
      itemCount: versesOfSelectedSurah.length,
      itemBuilder: (context, index) {
        var number = versesOfSelectedSurah[index].verseNumber;
        return CustomButton(
          title: "$number",
          state: context.watch<SurahDetailsProvider>().readingSettings.surahVerseIndex == index,
          centerTitle: false,
          height: 45,
          onTap: () {
            context.read<SurahDetailsProvider>().changeSurahVerseIndex(number! - 1);
            Utils.unFocus(context);
          },
        );
      },
    );
  }

  Widget get buildVerseSearch {
    return SearchSectionDrawer(
      hintText: context.translate.ayat,
      onChanged: onChangedVerse,
    );
  }
}
