import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:the_open_quran/constants/constants.dart';

class FontSliderCard extends StatelessWidget {
  final double value;
  final Function(dynamic) onChange;

  const FontSliderCard(
      {super.key, required this.value, required this.onChange});

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
              padding: const EdgeInsets.symmetric(horizontal: kSizeXL),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10.0,
                  trackShape: const RoundedRectSliderTrackShape(),
                  activeTrackColor:
                      context.theme.toggleButtonsTheme.borderColor,
                  inactiveTrackColor:
                      context.theme.toggleButtonsTheme.borderColor,
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
                  value: value,
                  min: 1.0,
                  max: 2.0,
                  onChanged: onChange,
                ),
              ),
            ),
          )),
    );
  }
}
