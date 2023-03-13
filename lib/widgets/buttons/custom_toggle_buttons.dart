import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import 'custom_button.dart';

class CustomToggleButtons extends StatelessWidget {
  /// Button labels
  final List<String> buttonTitles;

  /// Selected button index
  final int selectedIndex;

  /// Void call back returns [index]
  final Function(int index) onTap;

  const CustomToggleButtons(
      {Key? key,
      required this.buttonTitles,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color?.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: buttonTitles
            .map(
              (e) => Expanded(
                child: CustomButton(
                  title: e,
                  state: selectedIndex == getIndex(e),
                  onTap: () => selectedButton(e),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  /// Selecting [CustomButton] by [index]
  void selectedButton(String title) {
    int index = getIndex(title);
    if (index != -1) onTap(index);
  }

  /// Getting button [index]
  int getIndex(String title) {
    int index = buttonTitles.indexWhere((element) => element == title);
    return index;
  }
}
