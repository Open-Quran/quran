import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/padding.dart';

class DeleteDownloadedTranslationsButton extends StatelessWidget {
  const DeleteDownloadedTranslationsButton({Key? key, required this.onTap}) : super(key: key);

  /// On Tap for removing item
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 75,
        margin: const EdgeInsets.only(left: kSizeM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSizeM),
          color: AppColors.redOrange,
        ),
        child: Center(
          child: SvgPicture.asset(
            ImageConstants.delete,
          ),
        ),
      ),
    );
  }
}
