import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/cards/ayat_card.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/padding.dart';
import '../../models/ayat_model.dart';
import '../../widgets/basmala_title.dart';
import '../../widgets/buttons/custom_toggle_buttons.dart';

class SurahDetailsTranslationScreen extends StatefulWidget {
  const SurahDetailsTranslationScreen({Key? key}) : super(key: key);

  @override
  SurahDetailsTranslationScreenState createState() => SurahDetailsTranslationScreenState();
}

class SurahDetailsTranslationScreenState extends State<SurahDetailsTranslationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomDrawerScaffold(
      appBarTitle: "Al-Fatiha",
      drawer: const CustomDrawer(),
      onTapMore: () {},
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Column(
            children: [
              const SizedBox(height: 25),
              buildCustomToggleButtons(context),
              const BasmalaTitle(),
              buildAyatList,
            ],
          ),
        ),
      ),
    );
  }


  /// Switch [translation] or [reading]
  Widget buildCustomToggleButtons(BuildContext context) {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.translation,
        context.translate.reading,
      ],
      selectedIndex:
      context.watch<QuranProvider>().readingSettings.readingType.index,
      onTap: context.watch<QuranProvider>().changeReadingType,
    );
  }

  /// Listing ayats
  Widget get buildAyatList {
    return ListView.separated(
      itemCount: AyatModel.getTestData.length,
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: kPaddingVertical),
      itemBuilder: (context, index) => AyatCard(index: index),
      separatorBuilder: (context, index) =>
      const SizedBox(height: kPaddingContentSpaceBetween),
    );
  }
}
