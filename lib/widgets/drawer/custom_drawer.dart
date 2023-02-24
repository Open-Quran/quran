import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/grid_card.dart';
import 'package:fabrikod_quran/widgets/drawer/surah_section_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Utils.unFocus,
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: kSizeXXL,
            horizontal: kSizeXL,
          ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: context.theme.dividerColor),
            ),
          ),
          child: Column(
            children: [
              buildToggleButton,
              const SizedBox(height: kSizeXL),
              Expanded(child: body)
            ],
          ),
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
      selectedIndex:
          context.watch<SurahDetailsProvider>().readingSettings.surahDetailScreenMode.index,
      onTap: (index) {
        // context.read<SurahDetailsProvider>().changeSurahDetailScreenMod(index);
        // Utils.unFocus();
      },
    );
  }

  Widget get body {
    return IndexedStack(
      index: context.watch<SurahDetailsProvider>().readingSettings.surahDetailScreenMode.index,
      children: [
        buildSurah,
        buildJuz,
        buildSajda,
      ],
    );
  }

  Widget get buildSurah {
    return SurahSectionDrawer(
      surahs: context.watch<QuranProvider>().surahs,
      versesOfSelectedSurah: [],
    );
  }

  Widget get buildJuz {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: kSizeM * 2,
        crossAxisSpacing: kSizeM * 2,
      ),
      itemBuilder: (context, index) => GridCard(
          text: "${index + 1}",
          onTap: () {
            // context.read<SurahDetailsProvider>().selectJuz(index);
          }),
    );
  }

  Widget get buildSajda {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: context.watch<QuranProvider>().sajdaSurahs.length,
            itemBuilder: (context, index) {
              var surah = context.watch<QuranProvider>().sajdaSurahs[index];
              return CustomButton(
                title: "${surah.id}  ${surah.nameComplex}",
                state: false,
                centerTitle: false,
                height: 45,
                // onTap: () => context.read<SurahDetailsProvider>().changeSajdaIndex(index),
              );
            },
          ),
        ),
        VerticalDivider(
          color: context.theme.dividerColor,
          width: kSizeXL * 2,
          thickness: 2,
        ),
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
    );
  }
}
