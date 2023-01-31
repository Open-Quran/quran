import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: context.theme.textTheme.bodyLarge,
    );
  }
}
