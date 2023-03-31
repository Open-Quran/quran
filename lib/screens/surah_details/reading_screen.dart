import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants/padding.dart';
import '../../providers/quran_provider.dart';
import '../../providers/surah_details_provider.dart';
import '../../widgets/bars/reading_page_bottom_bar.dart';
import '../../widgets/quran/quran_page_widget.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  /// Scroll Controller for Verse List
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Item position listener of Verse list
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      itemScrollController.jumpTo(index: context.read<SurahDetailsProvider>().jumpToMushafPageListIndex);
      itemPositionsListener.itemPositions.addListener(scrollListener);
    });
  }

  /// Scroll Listener
  void scrollListener() {
    var first = itemPositionsListener.itemPositions.value.first.index;
    var last = itemPositionsListener.itemPositions.value.last.index;
    var index = first <= last ? first : last;
    context.read<SurahDetailsProvider>().listenToReadingScreenList(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScrollablePositionedList.separated(
        itemCount: context.watch<SurahDetailsProvider>().mushafPageList.length,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        padding: const EdgeInsets.symmetric(horizontal: kSizeXXL),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          var versesOfPage = context.watch<SurahDetailsProvider>().mushafPageList[index];
          return Column(
            children: [
              QuranPageWidget(
                versesOfPage: versesOfPage,
                layoutOptions: context.watch<QuranProvider>().localSetting.layoutOptions,
                fontTypeArabic: context.watch<QuranProvider>().localSetting.fontTypeArabic,
                textScaleFactor: context.watch<QuranProvider>().localSetting.textScaleFactor,
                onTap: context.read<SurahDetailsProvider>().changeReadingMode,
                surahDetailsPageTheme: context.watch<QuranProvider>().surahDetailsPageThemeColor,
              ),
              Visibility(
                visible: index == context.read<SurahDetailsProvider>().mushafPageList.length - 1,
                child: const ReadingPageBottomBar(),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: kSizeXL),
      ),
    );
  }
}
