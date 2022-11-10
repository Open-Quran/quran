import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/basmala_title.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/cards/action_card.dart';
import 'package:fabrikod_quran/widgets/number_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MushafScreen extends StatelessWidget {
  const MushafScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var surahs = context.watch<SurahDetailsProvider>().surahsOfMushafPage;
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: context.read<SurahDetailsProvider>().changeReadingMode,
            child: ListView.builder(
              itemCount: surahs.length,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: kPaddingHorizontal),
              itemBuilder: (context, index) {
                return buildSurah(context, surahs[index]);
              },
            ),
          ),
        ),
        buildButtons(context)
      ],
    );
  }

  Widget buildSurah(BuildContext context, SurahModel surah) {
    return Column(
      children: [
        BasmalaTitle(verseKey: surah.verses.first.verseKey ?? ""),
        const ActionCard(),
        const SizedBox(height: kPaddingHorizontal),
        buildVersesText(context, surah.verses),
        const SizedBox(height: kPaddingHorizontal),
      ],
    );
  }

  Widget buildVersesText(BuildContext context, List<VerseModel> verses) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color?.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(kPaddingContentSpaceBetween),
      child: RichText(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: context.theme.textTheme.headlineLarge,
          children: verses
              .map(
                (e) => TextSpan(
                  children: [TextSpan(text: e.text!), WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: NumberIcon(
                        number: e.verseNumber ?? 0,
                        isArabic: false,
                        size: 30,
                      ),
                    ),
                  ), ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    int pageNumber = context.watch<SurahDetailsProvider>().readingSettings.mushafPageNumber;
    return Visibility(
      visible: !context.watch<SurahDetailsProvider>().readingSettings.isReadingMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPaddingVertical),
        child: Row(
          children: [
            Expanded(
              child: Opacity(
                opacity: pageNumber > 603 ? 0.2 : 1.0,
                child: CustomButton(
                  title: context.translate.nextPage,
                  height: 55,
                  onTap: pageNumber > 603
                      ? null
                      : () => context.read<SurahDetailsProvider>().changeMushafPage(++pageNumber),
                ),
              ),
            ),
            const SizedBox(width: kPaddingDefault),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: context.theme.toggleButtonsTheme.selectedColor,
                borderRadius: BorderRadius.circular(kPaddingDefault),
              ),
              child: Center(
                child: Text(
                  pageNumber.toString(),
                  style: context.theme.toggleButtonsTheme.textStyle!
                      .copyWith(color: context.theme.toggleButtonsTheme.textStyle!.color),
                ),
              ),
            ),
            const SizedBox(width: kPaddingDefault),
            Expanded(
              child: Opacity(
                opacity: pageNumber < 2 ? 0.2 : 1.0,
                child: CustomButton(
                  title: context.translate.previousPage,
                  height: 55,
                  onTap: pageNumber < 2
                      ? null
                      : () => context.read<SurahDetailsProvider>().changeMushafPage(--pageNumber),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
