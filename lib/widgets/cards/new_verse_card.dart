import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.black9.withOpacity(0.26),
          borderRadius: BorderRadius.circular(kPaddingM)),
      child: Column(
        children: const [
          VerseCardArabic(
            numberOfVerse: '٣',
            verse:
                'ٱلرَّحْمَـٰنِ ٱلرَّحِيمِٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيمٱلرَّحْمَـٰنِ ٱلرَّحِيم',
          ),
          VerseCardDividerLine(),
          VerseCardTranslation(
            translation:
                'In the Name of Allah—the Most Compassionate, Most Merciful.In the Name of Allah—the Most Compassionate, Most Merciful.In the Name of Allah—the Most Compassionate, Most Merciful.In the Name of Allah—the Most Compassionate, Most Merciful.',
          )
        ],
      ),
    );
  }
}

//Arabic Verse and its number
class VerseCardArabic extends StatelessWidget {
  const VerseCardArabic({
    Key? key,
    required this.numberOfVerse,
    required this.verse,
  }) : super(key: key);

  final String numberOfVerse;
  final String verse;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPaddingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            numberOfVerse,
            textAlign: TextAlign.start,
            style: context.theme.textTheme.displayLarge
                ?.copyWith(color: AppColors.grey),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.black10.withOpacity(0),
                    AppColors.brandy.withOpacity(0.24),
                  ]),
                  borderRadius: BorderRadius.circular(kPaddingM)),
              padding: const EdgeInsets.all(kPaddingM),
              child: Text(
                verse,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                style: context.theme.textTheme.displayLarge
                    ?.copyWith(color: AppColors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Divider Line between arabic verse and its translation
class VerseCardDividerLine extends StatelessWidget {
  const VerseCardDividerLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          width: 320,
          height: 1,
          child: Container(
            margin: const EdgeInsets.only(right: kPaddingM),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                AppColors.black10.withOpacity(0),
                AppColors.grey10.withOpacity(1),
              ],
            )),
          ),
        ),
      ],
    );
  }
}

//Text of translation verse
class VerseCardTranslation extends StatelessWidget {
  const VerseCardTranslation({
    Key? key,
    required this.translation,
  }) : super(key: key);

  final String translation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingM),
      child: Text(
        translation,
        style: context.theme.textTheme.titleMedium
            ?.copyWith(color: AppColors.grey2),
        textAlign: TextAlign.end,
      ),
    );
  }
}
