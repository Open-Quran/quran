import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/mushaf_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      reverse: true,
      controller: context.read<SurahDetailsProvider>().pageController,
      onPageChanged: context.read<SurahDetailsProvider>().changeMushafPageNumberForScroll,
      children: List.generate(604, (index) => MushafPage(pageNo: index + 1)),
    );
  }
}
