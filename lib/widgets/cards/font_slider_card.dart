import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:fabrikod_quran/constants/padding.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FontSliderCard extends StatefulWidget {
  const FontSliderCard({super.key});

  @override
  State<FontSliderCard> createState() => _FontSliderCardState();
}

class _FontSliderCardState extends State<FontSliderCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
          height: 40,
          color: context.theme.cardTheme.color?.withOpacity(0.1),
          child: SliderTheme(
            data: const SliderThemeData(
              trackHeight: 40.0,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10.0,
                  trackShape: const RoundedRectSliderTrackShape(),
                  activeTrackColor: context.theme.toggleButtonsTheme.borderColor,
                  inactiveTrackColor: context.theme.toggleButtonsTheme.borderColor,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 14.0,
                    pressedElevation: 8.0,
                  ),
                ),
                child: SfSlider(
                    activeColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor,
                    inactiveColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor,
                    value: context.watch<QuranProvider>().localSetting.textScaleFactor,
                    min: 1.0,
                    max: 2.0,
                    onChanged: context.read<QuranProvider>().changeFontSize),
              ),
            ),
          )),
    );
  }
}
