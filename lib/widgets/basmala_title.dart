import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasmalaTitle extends StatelessWidget {
  final String verseKey;
  final bool isName;

  const BasmalaTitle({Key? key, required this.verseKey, this.isName = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isBasmalaVisible,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: kPaddingXL),
        padding: const EdgeInsets.all(kPaddingXL),
        decoration: BoxDecoration(
          color: context.theme.cardTheme.color?.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isName
                ? Text(surahName(context), style: context.theme.textTheme.displaySmall)
                : const SizedBox(),
            SizedBox(height: isName ? kPaddingXL : null),
            AutoSizeText(
              "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: context.theme.textTheme.displayLarge?.copyWith(
                fontFamily:
                    Fonts.getArabicFont(context.watch<QuranProvider>().localSetting.fontTypeArabic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Returning surah name
  String surahName(BuildContext context) {
    var list = verseKey.split(':');
    int index = int.parse(list.first);
    return context.read<QuranProvider>().surahs[index - 1].nameSimple ?? "";
  }

  /// Remove basmala title from some surahs ex: surah Tawbah
  bool get isBasmalaVisible {
    var list = verseKey.split(':');
    if (list[1] == "1" && verseKey != "9:1" && verseKey != "1:1") return true;
    return false;
  }
}
