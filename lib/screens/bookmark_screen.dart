import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/providers/bookmark_provider.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/bookmark_card.dart';
import 'package:fabrikod_quran/widgets/no_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: context.translate.bookmark),
      body: buildBody,
    );
  }

  Widget get buildBody {
    List<BookMarkModel> bookmarks = context.watch<BookmarkProvider>().bookmarks;
    return bookmarks.isEmpty
        ? NoItemWidget(
            text: context.translate.noBookMarkedSurahOrAyat,
            icon: const Icon(
              Icons.bookmark_remove_rounded,
              size: 80,
            ),
          )
        : ListView.separated(
            itemCount: bookmarks.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(
              vertical: kPaddingXXL,
              horizontal: kPaddingXL,
            ),
            itemBuilder: (context, index) {
              var bookmark = bookmarks[index];
              var isBookmarked =
                  context.read<BookmarkProvider>().isBookmark(bookmark);
              return BookmarkCard(
                bookMarkModel: bookmarks.elementAt(index),
                isBookmark: isBookmarked,
                bookmarkIconOnTap: () =>
                    context.read<BookmarkProvider>().bookmarkIconOnTap(
                          isBookmarked,
                          bookmark.verseModel,
                          bookmark.bookmarkType,
                        ),
                onTap: () => context
                    .read<BookmarkProvider>()
                    .bookmarkOnTap(context, bookmark),
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: kPaddingXL),
          );
  }
}
