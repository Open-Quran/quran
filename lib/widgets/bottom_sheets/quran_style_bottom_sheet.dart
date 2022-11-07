import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/font_slider_card.dart';
import 'package:fabrikod_quran/widgets/cards/font_type_card.dart';
import 'package:flutter/material.dart';

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
      decoration:  BoxDecoration(
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
          children: [
            Text(
              context.translate.quranType,
              style: context.theme.textTheme.headlineMedium!
                  .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kPaddingDefault),
            buildCustomToggleButton(context),
            const SizedBox(height: kPaddingDefault * 2),
            Text(
              context.translate.readingStyle,
              style: context.theme.textTheme.headlineMedium!
                  .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kPaddingDefault),
            buildSecondaryCustomToggleButton(context),
            const SizedBox(height: kPaddingDefault * 2),
            Text(
              context.translate.fontSize,
              style: context.theme.textTheme.headlineMedium!
                  .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
              textAlign: TextAlign.start,
            ),
            const FontSliderCard(),
            const SizedBox(height: kPaddingDefault * 2),
            Text(
              context.translate.fontType,
              style: context.theme.textTheme.headlineMedium!
                  .copyWith(color: context.theme.toggleButtonsTheme.borderColor),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kPaddingDefault),
            const FontTypeCard(text: "Deneme")
          ],
        ),
      ),
    );
  }

  /// [CustomToggleButtons]
  Widget buildCustomToggleButton(BuildContext context) {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.scroll,
        context.translate.mushaf,
      ],
      onTap: (int index) {},
      selectedIndex: 0,
    );
  }

  Widget buildSecondaryCustomToggleButton(BuildContext context) {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.all,
        context.translate.arabic,
        context.translate.translation
      ],
      onTap: (int index) {},
      selectedIndex: 0,
    );
  }
}
