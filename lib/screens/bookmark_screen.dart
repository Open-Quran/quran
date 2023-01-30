import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/primary_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/bookmark_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/bookmark_model.dart';
import '../providers/bookmark_provider.dart';
import '../widgets/no_item_widget.dart';

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
    return bookmarks.isEmpty
        ? NoItemWidget(
            text: context.translate.noBookMarksAdded,
            icon: SvgPicture.asset(
              ImageConstants.bookmarkInactiveIcon,
              width: 45,
              height: 55,
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kPaddingXL, vertical: kPaddingL),
              child: Column(
                children: [
                  Align(
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
                    itemCount: bookmarks.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: kPaddingL,
                    ),
                    itemBuilder: (context, item) => BookmarkCard(
                      verseModel: bookmarks.elementAt(item).verseModel,
                    ),
                    separatorBuilder: (context, item) =>
                        const SizedBox(height: kPaddingXL),
                  ),
                ],
              ),
            ),
          );
  }
}
