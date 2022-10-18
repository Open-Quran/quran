import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/action_card.dart';
import 'package:flutter/material.dart';

import '../../models/ayat_model.dart';

class AyatCard extends StatelessWidget {
  const AyatCard({Key? key, required this.index, this.ayatModel})
      : super(key: key);

  /// Getting ayat information
  final AyatModel? ayatModel;

  /// Ayat [index]
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAyatActionCart(context),
        buildAyat(context, index),
      ],
    );
  }

  /// The header of the card
  Widget buildAyatActionCart(BuildContext context) {
    return ActionCard(
        ayatNo: "1:1",
        playButtonOnTap: () {},
        favoriteButtonOnTap: () {},
        bookmarkButtonOnTap: () {},
        settingsButtonOnTap: () {});
  }


  Widget buildAyat(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        buildAyatText(index, context),
        const SizedBox(height: 20),
        buildAyatTranslationText(index, context),
        const SizedBox(height: 15),
        Divider(
          thickness: 1,
          color: context.theme.dividerColor,
        )
      ],
    );
  }

  /// Ayat
  Widget buildAyatText(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            AyatModel.getTestData[index].ayat,
            textDirection: TextDirection.rtl,
            style: context.theme.textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }

  /// Translation
  Widget buildAyatTranslationText(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            AyatModel.getTestData[index].ayatTranslation,
            style: context.theme.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
