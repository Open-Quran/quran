import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/widgets/title.dart';

import 'buttons/background_color_buttons.dart';

class BackgroundColorSelect extends StatelessWidget {
  const BackgroundColorSelect({
    Key? key,
    required this.colors,
    required this.defaultIndex,
    required this.onChangedColor,
    this.isPopUp = false,
  }) : super(key: key);
  final List<Color> colors;
  final int defaultIndex;
  final Function(int newIndex) onChangedColor;
  final bool isPopUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(titleText: context.translate.backgroundColor),
        Container(
          height: Utils.isSmallPhone(context)
              ? 40
              : Utils.isMediumPhone(context)
                  ? 40
                  : Utils.isTablet(context)
                      ? 70
                      : 100,
          margin: EdgeInsets.only(
            top: Utils.isSmallPhone(context) ? 10 : kSizeM,
            bottom: Utils.isSmallPhone(context) ? 10 : kSizeL,
          ),
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
