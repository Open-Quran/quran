import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  /// Button title
  final String title;

  /// Checking [true] or [false], by default is [true]
  final bool state;

  /// Void call back
  final Function()? onTap;

  const CustomButton({
    Key? key,
    required this.title,
    this.state = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: state
              ? context.theme.toggleButtonsTheme.selectedColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title,
              style: context.theme.toggleButtonsTheme.textStyle!.copyWith(
                  color: state
                      ? context.theme.toggleButtonsTheme.textStyle!.color
                      : context.theme.toggleButtonsTheme.selectedColor)),
        ),
      ),
    );
  }
}
