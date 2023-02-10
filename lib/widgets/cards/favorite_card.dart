import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/widgets/cards/slidable_verse_card/action_type_listener.dart';
import 'package:fabrikod_quran/widgets/cards/slidable_verse_card/slidable_controller_sender.dart';
import 'package:fabrikod_quran/widgets/cards/slidable_verse_card/slidable_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../buttons/delete_button.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    Key? key,
    required this.verseModel,
  }) : super(key: key);
  final VerseModel verseModel;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard>
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
        endActionPane: ActionPane(
          extentRatio: 0.30,
          motion: const ScrollMotion(),
          children: [
            DeleteButton(
              verseModel: widget.verseModel,
            )
          ],
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
              borderRadius: BorderRadius.circular(kSizeM)),
          child: Row(
            children: [
              const FavoriteIcon(),
              const SurahNames(
                  surahName: 'Al-Fatihah', surahNameTranslation: 'Al-Fatihah'),
              const Spacer(),
              PageNumber(pageNumber: widget.verseModel.pageNumber!)
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
      padding: const EdgeInsets.all(kSizeL),
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
      padding: const EdgeInsets.all(kSize3XL),
      child: Text(
        '$pageNumber',
        style: context.theme.textTheme.headlineSmall
            ?.copyWith(color: AppColors.grey6, fontSize: 10),
      ),
    );
  }
}
