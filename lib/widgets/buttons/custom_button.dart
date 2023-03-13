import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/padding.dart';

class CustomButton extends StatelessWidget {
  /// Button title
  final String title;

  /// Checking [true] or [false], by default is [true]
  final bool state;

  /// Checking [true] or [false], by default is [true]
  final bool centerTitle;

  /// Button height
  final double? height;

  /// Button radius
  final double? radius;

  /// Text Opacity
  final double? textOpacity;

  /// Void call back
  final Function()? onTap;

  const CustomButton({
    Key? key,
    required this.title,
    this.state = true,
    this.centerTitle = true,
    this.height,
    this.radius,
    this.textOpacity,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(kSizeM),
        alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: state
              ? context.theme.toggleButtonsTheme.selectedColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Opacity(
          opacity: textOpacity ?? 1.0,
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: context.theme.toggleButtonsTheme.textStyle!.copyWith(
                color: state
                    ? context.theme.toggleButtonsTheme.textStyle!.color
                    : context.theme.toggleButtonsTheme.selectedColor),
          ),
        ),
      ),
    );
  }
}
