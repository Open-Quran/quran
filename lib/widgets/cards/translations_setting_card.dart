import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'slidable_verse_card/action_type_listener.dart';
import 'slidable_verse_card/slidable_controller_sender.dart';
import 'slidable_verse_card/slidable_player.dart';

class TranslationsSettingCard extends StatefulWidget {
  const TranslationsSettingCard({Key? key}) : super(key: key);

  @override
  State<TranslationsSettingCard> createState() =>
      _TranslationsSettingCardState();
}

class _TranslationsSettingCardState extends State<TranslationsSettingCard>
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
        child: _buildTranslationsCard(),
      ),
    );
  }

  _buildTranslationsCard() {
    return SlidableControllerSender(
      child: ActionTypeListener(
        isFirstVerse: true,
        child: Container(
          width: double.infinity,
          height: 44,
          decoration: BoxDecoration(
              color: AppColors.black3,
              borderRadius: BorderRadius.circular(kPaddingM)),
          child: Padding(
            padding: const EdgeInsets.only(left: kPaddingM, right: kPaddingM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Data", style: context.theme.textTheme.headlineSmall),
                SvgPicture.asset(ImageConstants.ticIcon)
              ],
            ),
          ),
        ),
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(kPaddingL),
              bottomRight: Radius.circular(kPaddingL)),
          color: AppColors.redDark,
        ),
        child: Center(child: Text(context.translate.delete)),
      ),
    );
  }
}
