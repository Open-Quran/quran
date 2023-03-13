import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/padding.dart';

class CustomActiveButton extends StatelessWidget {
  /// Button title
  final String title;

  /// Button radius
  final double? radius;

  /// Text Opacity
  final double? textOpacity;

  /// Void call back
  final Function()? onTap;

  const CustomActiveButton({
    Key? key,
    required this.title,
    this.radius,
    this.textOpacity,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(kSizeM),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Opacity(
          opacity: textOpacity ?? 1.0,
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: context.theme.toggleButtonsTheme.textStyle!.copyWith(
                color: context.theme.toggleButtonsTheme.textStyle!.color),
          ),
        ),
      ),
    );
  }
}
