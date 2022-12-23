import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard(
      {Key? key,
      required this.surahName,
      required this.surahNameTranslation,
      required this.pageNumber})
      : super(key: key);

  final String surahName;
  final String surahNameTranslation;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(
        extentRatio: 0.30,
        motion: ScrollMotion(),
        children: [_buildDeleteButton()],
      ),
      child: Container(
        width: double.infinity,
        height: 72,
        decoration: BoxDecoration(
            color: AppColors.zeus,
            borderRadius: BorderRadius.circular(kPaddingM)),
        child: Row(
          children: [
            const FavoriteIcon(),
            SurahNames(
                surahName: surahName,
                surahNameTranslation: surahNameTranslation),
            const Spacer(),
            PageNumber(pageNumber: pageNumber)
          ],
        ),
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingL),
      child: SvgPicture.asset(
        ImageConstants.favoritesIconCard,
      ),
    );
  }
}

class SurahNames extends StatelessWidget {
  const SurahNames({
    Key? key,
    required this.surahName,
    required this.surahNameTranslation,
  }) : super(key: key);

  final String surahName;
  final String surahNameTranslation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          surahName,
          style: context.theme.textTheme.headlineSmall
              ?.copyWith(color: AppColors.grey),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          surahNameTranslation,
          style: context.theme.textTheme.headlineSmall
              ?.copyWith(color: AppColors.grey6, fontSize: 10),
        )
      ],
    );
  }
}

class PageNumber extends StatelessWidget {
  const PageNumber({
    Key? key,
    required this.pageNumber,
  }) : super(key: key);

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding3XL),
      child: Text(
        '$pageNumber',
        style: context.theme.textTheme.headlineSmall
            ?.copyWith(color: AppColors.grey6, fontSize: 10),
      ),
    );
  }
}

class _buildDeleteButton extends StatelessWidget {
  const _buildDeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        height: 70,
        width: 100,
        margin: const EdgeInsets.only(left: kPaddingM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPaddingM),
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
