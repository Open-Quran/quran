import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/new_surah_details_provider.dart';
import '../../providers/quran_provider.dart';
import '../../widgets/quran/quran_page_widget.dart';

class NewReadingScreen extends StatefulWidget {
  const NewReadingScreen({Key? key}) : super(key: key);

  @override
  State<NewReadingScreen> createState() => _NewReadingScreenState();
}

class _NewReadingScreenState extends State<NewReadingScreen> {
  /// Scroll Controller for Verse List
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Item position listener of Verse list
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      itemScrollController.jumpTo(index: context.read<NewSurahDetailsProvider>().jumpToMushafPageListIndex);
      itemPositionsListener.itemPositions.addListener(scrollListener);
    });
  }

  /// Scroll Listener
  void scrollListener() {
    var first = itemPositionsListener.itemPositions.value.first.index;
    var last = itemPositionsListener.itemPositions.value.last.index;
    var index = first <= last ? first : last;
    context.read<NewSurahDetailsProvider>().listenToReadingScreenList(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollablePositionedList.separated(
        itemCount: context.watch<NewSurahDetailsProvider>().mushafPageList.length,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        padding: const EdgeInsets.symmetric(horizontal: kSizeXXL),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          var versesOfPage = context.watch<NewSurahDetailsProvider>().mushafPageList[index];
          return Column(
            children: [
              QuranPageWidget(
                versesOfPage: versesOfPage,
                layoutOptions: context.watch<QuranProvider>().localSetting.layoutOptions,
                fontTypeArabic: context.watch<QuranProvider>().localSetting.fontTypeArabic,
                textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactor,
                onTap: context.read<NewSurahDetailsProvider>().changeReadingMode,
                surahDetailsPageTheme: context.watch<QuranProvider>().surahDetailsPageThemeColor,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: kSizeXL),
      ),
    );
  }
}
