import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../models/bookmark_model.dart';
import '../providers/bookmark_provider.dart';
import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/cards/bookmark_card.dart';
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
                  horizontal: kSizeXL, vertical: kSizeL),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.translate.bookmarks,
                      style: context.theme.textTheme.displayLarge,
                    ),
                  ),
                  ListView.separated(
                    itemCount: bookmarks.length,
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.symmetric(
                      vertical: kSizeL,
                    ),
                    itemBuilder: (context, item) => BookmarkCard(
                      onTap: () => context
                          .read<BookmarkProvider>()
                          .bookmarkOnTap(context, bookmarks.elementAt(item)),
                      verseModel: bookmarks.elementAt(item).verseModel,
                    ),
                    separatorBuilder: (context, item) =>
                        const SizedBox(height: kSizeXL),
                  ),
                ],
              ),
            ),
          );
  }
}
