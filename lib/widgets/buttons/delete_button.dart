import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/padding.dart';
import '../../models/verse_model.dart';
import '../../providers/favorites_provider.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.verseModel,
  }) : super(key: key);
  final VerseModel verseModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<FavoritesProvider>()
          .deleteVerseFromFavorites(verseModel),
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
