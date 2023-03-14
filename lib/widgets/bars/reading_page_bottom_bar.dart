import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_open_quran/constants/constants.dart';

class ReadingPageBottomBar extends StatelessWidget {
  const ReadingPageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kSizeXL),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomBarButtons(Text(
            context.translate.previous,
            style: context.theme.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          )),
          buildBottomBarButtons(RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
              ImageConstants.arrowBack,
            ),
          )),
          buildBottomBarButtons(Text(
            context.translate.next,
            style: context.theme.textTheme.headlineSmall,
          ))
        ],
      ),
    );
  }

  Container buildBottomBarButtons(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      alignment: Alignment.center,
      width: 90,
      height: double.infinity,
      decoration: BoxDecoration(color: AppColors.black3, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
