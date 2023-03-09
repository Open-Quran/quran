import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';

class GridCard extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const GridCard({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(kSizeM)),
      child: Card(
        color: AppColors.black4.withOpacity(0.47),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kSizeM)),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.displaySmall
                ?.copyWith(color: AppColors.grey),
          ),
        ),
      ),
    );
  }
}
