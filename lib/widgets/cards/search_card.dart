import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCard extends StatelessWidget {
  /// [SurahModel]
  final SurahModel surahModel;

  /// Function onTap
  final Function() onTap;

  const SearchCard({Key? key, required this.surahModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: kPaddingL),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPaddingM),
            color: AppColors.black2),
        child: Row(
          children: [
            const SizedBox(width: kPaddingXL),
            Visibility(child: Expanded(child: searchFor(context))),
            const SizedBox(width: kPaddingL),
          ],
        ),
      ),
    );
  }

  /// Search for input text
  Widget searchFor(BuildContext context) {
    return Text(
      "${context.translate.searchFor} \"${context.watch<SearchProvider>().textEditingController.text}\"",
      overflow: TextOverflow.ellipsis,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }
}
