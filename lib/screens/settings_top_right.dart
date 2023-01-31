import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/secondary_app_bar.dart';
import 'package:fabrikod_quran/widgets/buttons/sound_drop_down_button.dart';
import 'package:fabrikod_quran/widgets/buttons/translation_drop_down_button.dart';
import 'package:fabrikod_quran/widgets/surah_size_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/background_color_select.dart';
import '../widgets/buttons/layout_options_toggle_buttons.dart';
import '../widgets/buttons/read_options_toggle_buttons.dart';
import '../widgets/buttons/translation_options_toggle_buttons.dart';

class SettingsTopRight extends StatefulWidget {
  const SettingsTopRight({Key? key}) : super(key: key);

  @override
  State<SettingsTopRight> createState() => _SettingsTopRightState();
}

class _SettingsTopRightState extends State<SettingsTopRight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(
          title: 'Al-Fatihah', subTitle: 'Juz 1 | Hizb 1 - Page 1'),
      body: buildBody,
    );
  }

  Widget get buildBody {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kPaddingXL * 2, vertical: kPaddingXXL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReadOptionsToggleButton(
              listType: EReadOptions.surah,
              onChanged: (EReadOptions) {},
            ),
            const SurahSizeSlider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: TranslationOptionsToggleButton(
                      listType: ETranslationOptions.hide,
                      onChanged: (ETranslationOptions) {}),
                ),
                Expanded(
                  flex: 4,
                  child: LayoutOptionsToggleButton(
                      listType: ELayoutOptions.alignRight,
                      onChanged: (ELayoutOptions) {}),
                ),
              ],
            ),
            const SoundDropDown(),
            const TranslationDropDown(),
            BackgroundColorSelect(
              colors: const [
                AppColors.white2,
                AppColors.oasis,
                AppColors.white3,
                AppColors.grey7,
                AppColors.white4
              ],
              defaultIndex: 0,
              onChangedColor: (index) {},
            ),
          ],
        ),
      ),
    );
  }
}
