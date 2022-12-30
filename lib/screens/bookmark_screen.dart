import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/primary_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/bookmark_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/bookmark_model.dart';
import '../providers/bookmark_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: context.translate.theOpenQuran),
      body: buildBody,
    );
  }

  Widget get buildBody {
    List<BookMarkModel> bookmarks = context.watch<BookmarkProvider>().bookmarks;
    // return bookmarks.isEmpty
    //     ? NoItemWidget(
    //         text: context.translate.noBookMarkedSurahOrAyat,
    //         icon: const Icon(
    //           Icons.bookmark_remove_rounded,
    //           size: 80,
    //         ),
    //       )
    //     :
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kPaddingXL, vertical: kPaddingL),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                context.translate.bookmarks,
                style: context.theme.textTheme.displayLarge,
              ),
            ),
            ScrollablePositionedList.separated(
              itemScrollController:
                  context.watch<BookmarkProvider>().itemScrollController,
              itemPositionsListener:
                  context.watch<BookmarkProvider>().itemPositionsListener,
              itemCount: 10, //favoriteVerses.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: kPaddingL,
              ),
              itemBuilder: (context, index) => const BookmarkCard(
                surahName: 'Al - Fatihah',
                surahNameTranslation: 'The Opener',
                pageNumber: 254,
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: kPaddingXL),
            ),
          ],
        ),
      ),
    );
  }
}
