import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/widgets/quran/quran_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 604,
      padding: const EdgeInsets.symmetric(horizontal: kSizeL),
      itemBuilder: (context, index) {
        var versesOfPage = context.read<SurahDetailsProvider>().getSurahOfMushafPage(index + 1);
        return QuranPageWidget(
          versesOfPage: versesOfPage,
          layoutOptions: context.watch<QuranProvider>().localSetting.layoutOptions,
          fontTypeArabic: context.watch<QuranProvider>().localSetting.fontTypeArabic,
          textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactor,
          onTap: context.read<SurahDetailsProvider>().changeReadingMode,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: kSizeXL),
    );
  }
}
