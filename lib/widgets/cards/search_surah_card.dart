import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:flutter/material.dart';

class SearchSurahCard extends StatelessWidget {
  /// [SurahModel]
  final SurahModel surahModel;

  /// Function onTap
  final Function() onTap;

  const SearchSurahCard(
      {Key? key, required this.surahModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: kSizeL),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSizeM),
            color: AppColors.black2),
        child: Row(
          children: [
            const SizedBox(width: kSizeXL),
            Visibility(child: Expanded(child: surahName(context))),
            const SizedBox(width: kSizeL),
          ],
        ),
      ),
    );
  }

  /// Surah name in english
  Widget surahName(BuildContext context) {
    return Text(
      "${context.translate.surah} ${surahModel.nameSimple ?? ""}",
      overflow: TextOverflow.ellipsis,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }
}
