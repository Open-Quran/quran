import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_active_button.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/padding.dart';
import '../../models/ayat_model.dart';
import '../../widgets/action_card.dart';
import '../../widgets/basmala_title.dart';
import '../../widgets/buttons/custom_disabled_button.dart';
import '../../widgets/buttons/custom_toggle_buttons.dart';

class SurahDetailsReadingScreen extends StatefulWidget {
  const SurahDetailsReadingScreen({Key? key}) : super(key: key);

  @override
  SurahDetailsReadingScreenState createState() =>
      SurahDetailsReadingScreenState();
}

class SurahDetailsReadingScreenState extends State<SurahDetailsReadingScreen> {
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
              const SizedBox(height: 25),
              buildActionCart(context),
              const SizedBox(height: 25),
              Column(
                children: [
                  Center(
                    child: Text(
                      "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ ١ ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ ٢ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ ٣ مَـٰلِكِ يَوْمِ ٱلدِّينِ ٤ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ٥ ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ ٦ صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ ٧",
                      style: context.theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    thickness: 1,
                    color: context.theme.dividerColor,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: const [
                   Expanded(child: CustomDisabledButton(title: "Previous")),
                    SizedBox(width: 30),
                   Expanded(child: CustomActiveButton(title: "Next")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /// The action card
  Widget buildActionCart(BuildContext context) {
    return ActionCard(
        playButtonOnTap: () {},
        favoriteButtonOnTap: () {},
        bookmarkButtonOnTap: () {},
        settingsButtonOnTap: () {});
  }

  /// Basmala as header
  Widget buildBasmala(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            AyatModel.getTestData[0].ayat,
            style: context.theme.textTheme.displayLarge,
          ),
        ],
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
}
