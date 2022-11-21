import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/font_slider_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/font_type_card.dart';

class QuranStyleBottomSheet extends StatefulWidget {
  const QuranStyleBottomSheet({super.key});

  /// Method [show] called to display the bottom sheet
  static show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => const QuranStyleBottomSheet(),
      backgroundColor: Colors.transparent,
      barrierColor: context.theme.toggleButtonsTheme.disabledColor?.withOpacity(0.3),
      elevation: 0,
    );
  }

  @override
  State<QuranStyleBottomSheet> createState() => _QuranStyleBottomSheetState();
}

class _QuranStyleBottomSheetState extends State<QuranStyleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kPaddingDefault * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildReadingStyleLabel(),
            const SizedBox(height: kPaddingDefault),
            buildReadingStyleButtons(context),
            const SizedBox(height: kPaddingDefault * 2),
            buildFontSizeLabel(context),
            const FontSliderCard(),
            const SizedBox(height: kPaddingDefault * 2),
            // buildFontStyleLabel(context),
            // const SizedBox(height: kPaddingDefault),
            // const FontTypeCard(text: "Deneme")
          ],
        ),
      ),
    );
  }

  /// Font style label
  Text buildFontStyleLabel(BuildContext context) {
    return Text(
      context.translate.fontType,
      style: context.theme.textTheme.headlineMedium!
          .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
      textAlign: TextAlign.start,
    );
  }

  /// Font Size label
  Text buildFontSizeLabel(BuildContext context) {
    return Text(
      context.translate.fontSize,
      style: context.theme.textTheme.headlineMedium!
          .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
      textAlign: TextAlign.start,
    );
  }

  /// Reading style label
  Widget buildReadingStyleLabel() {
    return Text(
      context.translate.readingStyle,
      style: context.theme.textTheme.headlineMedium!
          .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
      textAlign: TextAlign.start,
    );
  }

  /// Reading style buttons from the [CustomToggleButtons]
  Widget buildReadingStyleButtons(BuildContext context) {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.all,
        context.translate.arabic,
        context.translate.translation
      ],
      onTap: context.read<QuranProvider>().changeReadingType,
      selectedIndex: context.watch<QuranProvider>().localSetting.readingType.index,
    );
  }
}
