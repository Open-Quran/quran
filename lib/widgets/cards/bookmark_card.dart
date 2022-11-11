import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/bookmark_model.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BookmarkCard extends StatelessWidget {
  final BookMarkModel bookMarkModel;
  final bool isBookmark;
  final Function()? bookmarkIconOnTap;
  final Function()? onTap;

  const BookmarkCard(
      {Key? key,
      required this.bookMarkModel,
      this.bookmarkIconOnTap,
      this.onTap,
      this.isBookmark = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(kPaddingDefault)),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: context.theme.cardTheme.color?.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(kPaddingDefault)),
        ),
        padding: const EdgeInsets.all(kPaddingDefault),
        child: Row(
          children: [
            Icon(
              Icons.arrow_right_rounded,
              color: context.theme.textTheme.titleSmall?.color,
              size: 25,
            ),
            Expanded(
              child: Text(
                text(context),
                style: context.theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
            const SizedBox(width: kPaddingDefault),
            GestureDetector(
              onTap: bookmarkIconOnTap,
              child: SvgPicture.asset(
                isBookmark
                    ? ImageConstants.bookmarkActiveIcon
                    : ImageConstants.bookmarkInactiveIcon,
                color: context.theme.iconTheme.color,
              ),
            )
          ],
        ),
      ),
    );
  }

  String text(BuildContext context) {
    var surahs = context.watch<QuranProvider>().surahs;
    if (surahs.isEmpty) return "";
    var surahName = surahs[bookMarkModel.verseModel.surahId! - 1].nameSimple ?? "";
    switch (bookMarkModel.bookmarkType) {
      case EBookMarkType.verse:
        return "$surahName ${bookMarkModel.verseModel.verseKey}";
      case EBookMarkType.page:
        return "$surahName ${context.translate.page}: ${bookMarkModel.verseModel.pageNumber}";
    }
  }
}
