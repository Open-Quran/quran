import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/juz_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  SurahDetailsProvider get surahDetailsProvider => context.watch<SurahDetailsProvider>();

  QuranProvider get quranProvider => context.watch<QuranProvider>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingVertical,
          horizontal: kPaddingHorizontal,
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: context.theme.dividerColor),
          ),
        ),
        child: Column(
          children: [
            buildToggleButton,
            const SizedBox(height: kPaddingHorizontal),
            Expanded(child: body)
          ],
        ),
      ),
    );
  }

  Widget get buildToggleButton {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.surah,
        context.translate.juz,
        context.translate.sajda,
      ],
      selectedIndex: surahDetailsProvider.readingSettings.surahDetailScreenMod.index,
      onTap: surahDetailsProvider.changeSurahDetailScreenMod,
    );
  }

  Widget get body {
    return IndexedStack(
      index: surahDetailsProvider.readingSettings.surahDetailScreenMod.index,
      children: [
        buildSurah,
        buildJuz,
        buildSajda,
      ],
    );
  }

  Widget get buildSurah {
    var surahs = quranProvider.surahs;
    var versesOfSelectSurah =
        quranProvider.surahs[surahDetailsProvider.readingSettings.surahIndex].verses;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CustomButton(
                title: context.translate.searchSurah,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: surahs.length,
                  itemBuilder: (context, index) {
                    var surah = surahs[index];
                    return CustomButton(
                      title: "${surah.id}  ${surah.nameComplex}",
                      state: surahDetailsProvider.readingSettings.surahIndex == index,
                      centerTitle: false,
                      height: 45,
                      onTap: () => context.read<SurahDetailsProvider>().changeSurahIndex(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: context.theme.dividerColor,
          width: kPaddingHorizontal * 2,
          thickness: 2,
        ),
        Expanded(
          child: Column(
            children: [
              CustomButton(
                title: context.translate.ayat,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: versesOfSelectSurah.length,
                  itemBuilder: (context, index) {
                    var number = versesOfSelectSurah[index].verseNumber;
                    return CustomButton(
                      title: "$number",
                      state: surahDetailsProvider.readingSettings.surahVerseIndex == index,
                      centerTitle: false,
                      height: 45,
                      onTap: () =>
                          context.read<SurahDetailsProvider>().changeSurahVerseIndex(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get buildJuz {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: kPaddingDefault * 2,
        crossAxisSpacing: kPaddingDefault * 2,
      ),
      itemBuilder: (context, index) => JuzCard(
        index: index,
        onTap: context.read<SurahDetailsProvider>().selectJuz,
      ),
    );
  }

  Widget get buildSajda {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CustomButton(
                title: context.translate.searchSurah,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: quranProvider.sajdaSurahs.length,
                  itemBuilder: (context, index) {
                    var surah = quranProvider.sajdaSurahs[index];
                    return CustomButton(
                      title: "${surah.id}  ${surah.nameComplex}",
                      state: surahDetailsProvider.readingSettings.sajdaIndex == index,
                      centerTitle: false,
                      height: 45,
                      onTap: () => context.read<SurahDetailsProvider>().changeSajdaIndex(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: context.theme.dividerColor,
          width: kPaddingHorizontal * 2,
          thickness: 2,
        ),
        Expanded(
          child: Column(
            children: [
              CustomButton(
                title: context.translate.ayat,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return CustomButton(
                      title: "${index + 1}",
                      state: true,
                      centerTitle: false,
                      height: 45,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
