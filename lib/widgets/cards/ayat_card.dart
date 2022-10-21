import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/widgets/action_card.dart';
import 'package:flutter/material.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({Key? key, required this.index, this.verseModel}) : super(key: key);

  /// Getting verse information
  final VerseModel? verseModel;

  /// Verse [index]
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
            "Test Data",
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
            "Test Data",
            style: context.theme.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
