import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurahCard extends StatelessWidget {
  final SurahModel surahModel;
  final Function() onTap;

  const SurahCard({Key? key, required this.surahModel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Row(
              children: [
                buildSurahNumber(context),
                const SizedBox(width: kPaddingContentSpaceBetween),
                Expanded(child: buildSurahDetail(context)),
                const SizedBox(width: kPaddingContentSpaceBetween),
                buildSurahNameAr(context),
              ],
            ),
            const SizedBox(height: kPaddingDefault),
            const Divider(thickness: 1, height: 1)
          ],
        ),
      ),
    );
  }

  Widget buildSurahNumber(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SvgPicture.asset(
          ImageConstants.surahNumberFrame,
          color: context.theme.appBarTheme.titleTextStyle?.color,
        ),
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
              child: AutoSizeText(
                surahModel.id.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleLarge
                    ?.copyWith(color: context.theme.backgroundColor),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildSurahDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          surahModel.nameSimple ?? "",
          overflow: TextOverflow.ellipsis,
          style: context.theme.textTheme.headlineMedium,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "${surahModel.verses.length} ${context.translate.ayat}",
            style: context.theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget buildSurahNameAr(BuildContext context) {
    return Text(
      surahModel.nameArabic ?? "",
      style: context.theme.textTheme.headlineLarge,
    );
  }
}
