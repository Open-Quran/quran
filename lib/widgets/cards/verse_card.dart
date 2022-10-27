import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/widgets/cards/action_card.dart';
import 'package:flutter/material.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({Key? key, required this.verseModel}) : super(key: key);

  /// Getting verse information
  final VerseModel verseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildVerseActionCart,
        buildVerse(context),
      ],
    );
  }

  /// The header of the card
  Widget get buildVerseActionCart {
    return ActionCard(verseKey: verseModel.verseKey);
  }

  Widget buildVerse(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        buildVerseText(context),
        const SizedBox(height: 20),
        buildVerseTranslationText(context),
        const SizedBox(height: 15),
        Divider(thickness: 1, color: context.theme.dividerColor)
      ],
    );
  }

  /// Verse Text
  Widget buildVerseText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            verseModel.text ?? "",
            textDirection: TextDirection.rtl,
            style: context.theme.textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }

  /// Verse Translation Text
  Widget buildVerseTranslationText(BuildContext context) {
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
