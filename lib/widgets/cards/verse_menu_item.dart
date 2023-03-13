import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';

class VerseMenuItem extends StatelessWidget {
  const VerseMenuItem(
      {Key? key, required this.iconPath, required this.buttonName})
      : super(key: key);
  final String iconPath;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 45,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(iconPath,
                color: AppColors.white, width: kSizeXL, height: kSizeXL),
          ),
          const SizedBox(
            width: kSizeL,
          ),
          Expanded(
            flex: 3,
            child: Text(
              buttonName,
              style: context.theme.textTheme.titleMedium
                  ?.copyWith(color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
