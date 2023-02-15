import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/padding.dart';
import '../../models/verse_model.dart';
import '../../providers/favorites_provider.dart';
import '../cards/slidable_verse_card/slidable_provider.dart';

class DeleteVerseButton extends StatelessWidget {
  const DeleteVerseButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  /// On Tap for removing item
  final Function() onTap;

  /// Custom button
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 100,
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
