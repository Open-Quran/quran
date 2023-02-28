import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/screens/quran_translation_screen.dart';
import 'package:fabrikod_quran/widgets/buttons/quran_font_button.dart';
import 'package:fabrikod_quran/widgets/buttons/sound_drop_down_button.dart';
import 'package:fabrikod_quran/widgets/buttons/translation_box.dart';
import 'package:fabrikod_quran/widgets/surah_size_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/background_color_select.dart';
import '../widgets/buttons/layout_options_toggle_buttons.dart';
import '../widgets/buttons/read_options_toggle_buttons.dart';

class VerseDetailsSettings extends StatefulWidget {
  const VerseDetailsSettings({Key? key}) : super(key: key);

  @override
  State<VerseDetailsSettings> createState() => _VerseDetailsSettingsState();
}

class _VerseDetailsSettingsState extends State<VerseDetailsSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody,
    );
  }

  Widget get buildBody {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kSize3XL, vertical: kSizeXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReadOptionsToggleButton(
            isPopUp: false,
            listType: context.watch<QuranProvider>().localSetting.readOptions,
            onValueChanged: context.read<QuranProvider>().changeReadingType,
          ),
          SurahSizeSlider(
            isPopUp: false,
            size: context.watch<QuranProvider>().localSetting.textScaleFactor,
            onChanged: context.read<QuranProvider>().changeFontSize,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const QuranFontButton(),
              LayoutOptionsToggleButton(
                isPopUp: false,
                layoutOptions:
                    context.watch<QuranProvider>().localSetting.layoutOptions,
                onChanged: context.read<QuranProvider>().changeLayoutOptions,
              ),
            ],
          ),
          const SoundDropDown(),
          TranslationBox(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const QuranTranslationsScreen();
                },
              ));
            },
          ),
          BackgroundColorSelect(
            colors: const [
              AppColors.white2,
              AppColors.oasis,
              AppColors.white3,
              AppColors.grey7,
              AppColors.pink
            ],
            defaultIndex: context.watch<QuranProvider>().localSetting.surahDetailsPageThemeIndex,
            onChangedColor: context.read<QuranProvider>().changeSurahDetailsPageTheme,
          ),
        ],
      ),
    );
  }
}
