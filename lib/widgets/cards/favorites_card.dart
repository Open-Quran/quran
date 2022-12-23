import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/cards/slidable_verse_card/action_type_listener.dart';
import 'package:fabrikod_quran/widgets/cards/slidable_verse_card/slidable_controller_sender.dart';
import 'package:fabrikod_quran/widgets/cards/slidable_verse_card/slidable_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesCard extends StatefulWidget {
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
  State<FavoritesCard> createState() => _FavoritesCardState();
}

class _FavoritesCardState extends State<FavoritesCard>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        upperBound: 0.5,
        duration: const Duration(microseconds: 2000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidablePlayer(
      animation: animationController,
      child: Slidable(
        endActionPane: const ActionPane(
          extentRatio: 0.30,
          motion: ScrollMotion(),
          children: [_buildDeleteButton()],
        ),
        child: _buildFavoriteCard(),
      ),
    );
  }

  _buildFavoriteCard() {
    return SlidableControllerSender(
      child: ActionTypeListener(
        isFirstVerse: true,
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
                  surahName: widget.surahName,
                  surahNameTranslation: widget.surahNameTranslation),
              const Spacer(),
              PageNumber(pageNumber: widget.pageNumber)
            ],
          ),
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
