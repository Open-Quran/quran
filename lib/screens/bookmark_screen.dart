import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/primary_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/bookmark_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(kPaddingXL, kPaddingL, 0, 0),
            child: Text(
              'Bookmarks',
              style: context.theme.textTheme.displayLarge,
            ),
          ),
          ListView.separated(
            itemCount: 10, //favoriteVerses.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(
              vertical: kPaddingL,
              horizontal: kPaddingXL,
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
    );
  }
}
