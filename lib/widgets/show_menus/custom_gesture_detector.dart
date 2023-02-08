import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/widgets/cards/verse_menu_item.dart';
import 'package:flutter/material.dart';

/// CustomGestureDetector takes globalKey to identify child
class CustomGestureDetector extends StatelessWidget {
  const CustomGestureDetector({
    Key? key,
    required this.child,
    required this.globalKey,
    required this.verseModel,
    required this.playFunction,
    required this.favoriteFunction,
    required this.bookmarkFunction,
    required this.shareFunction,
    this.isPlaying = false,
    this.isFavorite = false,
    this.isBookmark = false,
  }) : super(key: key);
  final Widget child;
  final GlobalKey globalKey;
  final VerseModel verseModel;
  final bool isPlaying;
  final bool isFavorite;
  final bool isBookmark;
  final Function(VerseModel verseModel, bool isPlaying) playFunction;
  final Function(VerseModel verseModel, bool isFavorite) favoriteFunction;
  final Function(EBookMarkType bookMarkType, VerseModel verseModel, bool isBookmark)
      bookmarkFunction;
  final Function(VerseModel) shareFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        RenderBox box = globalKey.currentContext?.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        showMenu(
          context: context,
          color: AppColors.grey8,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          position: RelativeRect.fromRect(
            Rect.fromLTWH(position.dx + kPaddingM,
                position.dy + (box.paintBounds.size.height - 200 - kPaddingM), 0, 0),
            Rect.fromLTWH(0, 0, box.paintBounds.size.width, box.paintBounds.size.height),
          ),
          items: [
            PopupMenuItem(
              onTap: () => playFunction(verseModel, isPlaying),
              child: VerseMenuItem(
                iconPath: isPlaying ? ImageConstants.pauseIcon : ImageConstants.play,
                buttonName: isPlaying ? context.translate.pause : context.translate.play,
              ),
            ),
            PopupMenuItem(
              onTap: () => favoriteFunction(verseModel, isFavorite),
              child: VerseMenuItem(
                iconPath: isFavorite
                    ? ImageConstants.favoriteActiveIcon
                    : ImageConstants.favoriteInactiveIcon,
                buttonName: context.translate.favorite,
              ),
            ),
            PopupMenuItem(
              onTap: () => bookmarkFunction(EBookMarkType.verse, verseModel, isBookmark),
              child: VerseMenuItem(
                iconPath: isBookmark
                    ? ImageConstants.bookmarkActiveIcon
                    : ImageConstants.bookmarkInactiveIcon,
                buttonName: context.translate.bookmark,
              ),
            ),
            PopupMenuItem(
              onTap: () => shareFunction(verseModel),
              child: VerseMenuItem(
                iconPath: ImageConstants.shareAppIcon,
                buttonName: context.translate.share,
              ),
            ),
          ],
        );
      },
      child: child,
    );
  }
}
