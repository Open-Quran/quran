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
        margin: const EdgeInsets.only(bottom: kPaddingHorizontal),
        padding: const EdgeInsets.all(kPaddingHorizontal),
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
            SizedBox(height: isName ? kPaddingHorizontal : null),
            Text(
              "ِﻢﻳ۪حَّﺮﻟا ِنٰمْحَّﺮﻟا ِهّٰﻞﻟا ِمْسِب",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }

  String surahName(BuildContext context) {
    var list = verseKey.split(':');
    int index = int.parse(list.first);
    return context.read<QuranProvider>().surahs[index - 1].nameSimple ?? "";
  }

  bool get isBasmalaVisible {
    var list = verseKey.split(':');
    if (list[1] == "1" && verseKey != "9:1" && verseKey != "1:1") return true;
    return false;
  }
}
