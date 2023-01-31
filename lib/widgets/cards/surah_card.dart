import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:flutter/material.dart';

class SurahCard extends StatelessWidget {
  final SurahModel surahModel;
  final Function() onTap;

  const SurahCard({Key? key, required this.surahModel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kPaddingM),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.black2,
          borderRadius: BorderRadius.circular(kPaddingM),
        ),
        padding: const EdgeInsets.symmetric(horizontal: kPaddingXXL),
        child: Row(
          children: [
            buildSurahNumber(context),
            const SizedBox(width: kPaddingXXL),
            Expanded(child: buildSurahNames(context)),
            const SizedBox(width: kPaddingXXL),
            buildVersesCount(context),
          ],
        ),
      ),
    );
  }

  Widget buildSurahNumber(BuildContext context) {
    return Text(
      surahModel.id.toString(),
      style: context.theme.textTheme.displaySmall?.copyWith(
        letterSpacing: 0.04,
        color: AppColors.grey,
      ),
    );
  }

  Widget buildSurahNames(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          surahModel.nameSimple.toString(),
          style: context.theme.textTheme.headlineSmall?.copyWith(
            letterSpacing: 0.04,
            color: AppColors.grey,
          ),
        ),
        const SizedBox(height: kPaddingS),
        Text(
          surahModel.nameTranslated.toString(),
          style: context.theme.textTheme.labelMedium?.copyWith(
            letterSpacing: 0.04,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildVersesCount(BuildContext context) {
    return Text(
      "${surahModel.verses.length} ${context.translate.ayat}",
      style: context.theme.textTheme.labelMedium?.copyWith(
        letterSpacing: 0.04,
        color: AppColors.grey6,
      ),
    );
  }
}
