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
                context.watch<SurahDetailsProvider>().readingSettings.surahId >
                        1
                    ? context.translate.previousSurah
                    : "",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodySmall,
              ),
              context.read<SurahDetailsProvider>().previousButtonOnTap,
              context.watch<SurahDetailsProvider>().readingSettings.surahId > 1
                  ? BoxDecoration(
                      color: AppColors.black3,
                      borderRadius: BorderRadius.circular(10))
                  : const BoxDecoration()),
          buildBottomBarButtons(
              Text(
                context.translate.beggingOfSurah,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodySmall,
              ),
              context.read<SurahDetailsProvider>().beggingOfSurahButtonOnTap,
              BoxDecoration(
                  color: AppColors.black3,
                  borderRadius: BorderRadius.circular(10))),
          buildBottomBarButtons(
              Text(
                context.watch<SurahDetailsProvider>().readingSettings.surahId <
                        114
                    ? context.translate.nextSurah
                    : "",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodySmall,
              ),
              context.read<SurahDetailsProvider>().nextButtonOnTap,
              context.watch<SurahDetailsProvider>().readingSettings.surahId < 114
                  ? BoxDecoration(
                      color: AppColors.black3,
                      borderRadius: BorderRadius.circular(10))
                  : const BoxDecoration()),
        ],
      ),
    );
  }

  Widget buildBottomBarButtons(
      Widget child, Function() onTap, BoxDecoration decoration) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        alignment: Alignment.center,
        width: 90,
        height: double.infinity,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
