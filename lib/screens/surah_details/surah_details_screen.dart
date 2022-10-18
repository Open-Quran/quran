import 'package:fabrikod_quran/screens/surah_details/surah_details_reading.dart';
import 'package:fabrikod_quran/screens/surah_details/surah_details_translation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/quran_provider.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return body;
  }

  Widget get body {
    return IndexedStack(
      index: context.watch<QuranProvider>().readingSettings.readingType.index,
      children: const [
        SurahDetailsTranslationScreen(),
        SurahDetailsReadingScreen(),
      ],
    );
  }
}
