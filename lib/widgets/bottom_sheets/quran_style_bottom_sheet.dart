import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/custom_expanding_font_card.dart';
import 'package:fabrikod_quran/widgets/cards/font_slider_card.dart';
import 'package:fabrikod_quran/widgets/cards/selected_tranlations_card.dart';
import 'package:fabrikod_quran/widgets/cards/translations_card.dart';
import 'package:fabrikod_quran/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isOpenTranslations = false;

  changedOpenTranslations() {
    setState(() {
      isOpenTranslations = !isOpenTranslations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPaddingM * 3),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(kPaddingXL)),
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: isOpenTranslations
            ? TranslationsCard(onBack: changedOpenTranslations)
            : Column(
                children: [
                  buildSelectedTranslations,
                  buildReadingStyle,
                  buildTranslateFontSize,
                  buildTranslationFontType,
                  buildArabicFontSize,
                  buildArabicFontType,
                ],
              ),
      ),
    );
  }

  /// Bars' Title
  Widget buildTitle(String text) {
    return Text(
      text,
      style: context.theme.textTheme.headlineMedium!.copyWith(
        color: context.theme.toggleButtonsTheme.borderColor,
      ),
      textAlign: TextAlign.start,
    );
  }

  /// Translations
  Widget get buildSelectedTranslations {
    return Visibility(
      visible: context.watch<QuranProvider>().localSetting.quranType == EQuranType.translation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context.translate.selectedTranslation),
          CustomSpace.normal(),
          SelectedTranslationsCard(
            onTap: changedOpenTranslations,
            activeTranslations:
                context.watch<QuranProvider>().translationService.activeTranslations,
          ),
          CustomSpace.big(),
        ],
      ),
    );
  }

  /// Reading style buttons from the [CustomToggleButtons]
  Widget get buildReadingStyleButtons {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.all,
        context.translate.arabic,
        context.translate.translation
      ],
      onTap: (index) {},
      selectedIndex: context.watch<QuranProvider>().localSetting.readOptions.index,
    );
  }

  /// Getting Reading Style Bar
  Widget get buildReadingStyle {
    return Visibility(
      visible: context.watch<QuranProvider>().localSetting.quranType == EQuranType.translation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context.translate.readingStyle),
          CustomSpace.normal(),
          buildReadingStyleButtons,
          CustomSpace.big(),
        ],
      ),
    );
  }

  /// Getting Translate Font Size Bar
  Widget get buildTranslateFontSize {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("${context.translate.fontSize} (${context.translate.translation})"),
        CustomSpace.normal(),
        FontSliderCard(
          value: context.watch<QuranProvider>().localSetting.textScaleFactor,
          onChange: context.read<QuranProvider>().changeFontSize,
        ),
        CustomSpace.big(),
      ],
    );
  }

  /// Getting Arabic Font Size Bar
  Widget get buildArabicFontSize {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("${context.translate.fontSize} (${context.translate.arabic})"),
        const SizedBox(height: kPaddingM),
        FontSliderCard(
          value: context.watch<QuranProvider>().localSetting.textScaleFactorArabic,
          onChange: context.read<QuranProvider>().changeFontSizeArabic,
        ),
        CustomSpace.big(),
      ],
    );
  }

  /// Getting Translation Font Type Bar
  Widget get buildTranslationFontType {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomExpandingFontCard(
          title: "${context.translate.fontType} (${context.translate.translation})",
          defaultFont: context.watch<QuranProvider>().localSetting.fontType,
          changedFont: context.read<QuranProvider>().changeFontType,
          fonts: Fonts.translationFontNames,
        ),
        CustomSpace.big(),
      ],
    );
  }

  /// Getting Arabic Font Type Bar
  Widget get buildArabicFontType {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomExpandingFontCard(
          title: "${context.translate.fontType} (${context.translate.arabic})",
          defaultFont: context.watch<QuranProvider>().localSetting.fontTypeArabic,
          changedFont: context.read<QuranProvider>().changeFontTypeArabic,
          fonts: Fonts.arabicFontNames,
        ),
        CustomSpace.big(),
      ],
    );
  }
}
