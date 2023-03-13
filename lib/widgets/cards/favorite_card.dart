import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/widgets/cards/slidable_verse_card/action_type_listener.dart';
import 'package:the_open_quran/widgets/cards/slidable_verse_card/slidable_controller_sender.dart';
import 'package:the_open_quran/widgets/cards/slidable_verse_card/slidable_player.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';
import '../../models/verse_model.dart';
import '../../providers/favorites_provider.dart';
import '../buttons/delete_verse_button.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    Key? key,
    required this.verseModel,
    required this.onTap,
  }) : super(key: key);

  /// [VerseModel]
  final VerseModel verseModel;

  /// Favorite item onTap
  final Function() onTap;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the [SlidablePlayer]
  AnimationController? animationController;

  @override
  void initState() {
    /// Animate delete button
    animationController = AnimationController(
        vsync: this,
        upperBound: 0.5,
        duration: const Duration(microseconds: 2000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidablePlayer(
      key: UniqueKey(),
      animation: animationController,
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.30,
          motion: const ScrollMotion(),
          children: [
            DeleteVerseButton(
              onTap: () => context
                  .read<FavoritesProvider>()
                  .deleteVerseFromFavorites(widget.verseModel),
            )
          ],
        ),
        child: buildFavoriteCard(),
      ),
    );
  }

  /// Favorite card item
  buildFavoriteCard() {
    return SlidableControllerSender(
      child: ActionTypeListener(
        isFirstVerse: true,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
                color: AppColors.zeus,
                borderRadius: BorderRadius.circular(kSizeM)),
            child: Row(
              children: [
                buildIcon(),
                buildSurahName(widget.verseModel.surahNameSimple ?? "",
                    widget.verseModel.surahNameTranslated ?? ""),
                const Spacer(),
                buildAyatNumber(
                    "${context.translate.ayat} ${widget.verseModel.verseNumber!.toString()}")
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Favorite card icon
  buildIcon() {
    return Padding(
      padding: const EdgeInsets.all(kSizeL),
      child: SvgPicture.asset(
        ImageConstants.favoritesIconCard,
      ),
    );
  }

  /// Surah name and translation name
  buildSurahName(String surahName, String surahNameTranslation) {
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

  /// Surah ayat number
  buildAyatNumber(String ayatNo) {
    return Padding(
      padding: const EdgeInsets.all(kSize3XL),
      child: Text(
        ayatNo,
        style: context.theme.textTheme.headlineSmall
            ?.copyWith(color: AppColors.grey6, fontSize: 10),
      ),
    );
  }
}
