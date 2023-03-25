import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/providers/surah_details_provider.dart';

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
          buildBottomBarButtons(
              Text(
                context.translate.previousSurah,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headlineSmall,
              ),
              context.read<SurahDetailsProvider>().previousButtonOnTap),
          buildBottomBarButtons(
              Text(
                context.translate.beggingOfSurah,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headlineSmall,
              ),
              context.read<SurahDetailsProvider>().beggingOfSurahButtonOnTap),
          buildBottomBarButtons(
              Text(
                context.translate.nextSurah,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headlineSmall,
              ),
              context.read<SurahDetailsProvider>().nextButtonOnTap)
        ],
      ),
    );
  }

  Widget buildBottomBarButtons(Widget child, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        alignment: Alignment.center,
        width: 90,
        height: double.infinity,
        decoration: BoxDecoration(color: AppColors.black3, borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}
