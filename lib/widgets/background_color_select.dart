import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/title.dart';
import 'package:flutter/material.dart';

import 'buttons/background_color_buttons.dart';

class BackgroundColorSelect extends StatelessWidget {
  const BackgroundColorSelect(
      {Key? key,
      required this.colors,
      required this.defaultIndex,
      required this.onChangedColor})
      : super(key: key);
  final List<Color> colors;
  final int defaultIndex;
  final Function(int newIndex) onChangedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(titleText: context.translate.backgroundColor),
        Container(
          margin: const EdgeInsets.only(top: kSizeXL, bottom: kSizeXXL),
          child: Row(
            children: List.generate(colors.length, (index) {
              return Expanded(
                  child: BackgroundColorsButton(
                      backgroundColor: colors.elementAt(index),
                      isSelected: index == defaultIndex ? true : false,
                      onTap: () => onChangedColor(index)));
            }),
          ),
        ),
      ],
    );
  }
}
