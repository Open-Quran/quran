import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/widgets/number_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSurahCard extends StatelessWidget {

  /// [SurahModel]
  final SurahModel surahModel;

  /// Function onTap
  final Function() onTap;

  const SearchSurahCard({Key? key, required this.surahModel, required this.onTap})
      : super(key: key);

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
                Icon(
                  Icons.arrow_right_outlined,
                  size: 30,
                  color: context.theme.iconTheme.color,
                ),
                const SizedBox(width: kPaddingL),
                Visibility(child: Expanded(child: surahName(context))),
                const SizedBox(width: kPaddingL),
                buildSurahNameAr(context),
              ],
            ),
            const SizedBox(height: kPaddingM),
            const Divider(thickness: 1, height: 1)
          ],
        ),
      ),
    );
  }

  /// Surah name in english
  Widget surahName(BuildContext context) {
    return Text(
      surahModel.nameSimple ?? "",
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.headlineMedium,
    );
  }

  /// Surah name in arabic
  Widget buildSurahNameAr(BuildContext context) {
    return Text(
      surahModel.nameArabic ?? "",
      style: context.theme.textTheme.headlineLarge,
    );
  }
}
