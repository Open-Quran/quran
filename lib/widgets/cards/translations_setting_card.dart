import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TranslationsSettingCard extends StatelessWidget {
  const TranslationsSettingCard({
    Key? key,
    required this.translationAuthor,
    required this.onTap,
  }) : super(key: key);

  final TranslationAuthor translationAuthor;
  final Function(TranslationAuthor translationAuthor) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(translationAuthor),
      borderRadius: BorderRadius.circular(kSizeM),
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.black3,
          borderRadius: BorderRadius.circular(kSizeM),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: kSizeM, right: kSizeM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  translationAuthor.translationName ?? "",
                  style: context.theme.textTheme.headlineSmall,
                ),
              ),
              getIcon
            ],
          ),
        ),
      ),
    );
  }

  Widget get getIcon {
    switch (translationAuthor.verseTranslationState) {
      case EVerseTranslationState.download:
        return SvgPicture.asset(ImageConstants.icTranslationDownload);
      case EVerseTranslationState.downloading:
        return SvgPicture.asset(ImageConstants.icTranslationDownloading);
      case EVerseTranslationState.downloaded:
        return translationAuthor.isTranslationSelected
            ? SvgPicture.asset(ImageConstants.ticIcon)
            : const SizedBox();
    }
  }
}
