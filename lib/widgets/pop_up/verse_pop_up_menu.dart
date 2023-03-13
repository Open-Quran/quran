import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/widgets/cards/verse_menu_item.dart';

import '../../constants/enums.dart';
import '../../models/verse_model.dart';

/// CustomGestureDetector takes globalKey to identify child
class VersePopUpMenu extends StatelessWidget {
  const VersePopUpMenu({
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
    required this.changeSelectedVerseKey,
  }) : super(key: key);
  final Widget child;
  final GlobalKey globalKey;
  final VerseModel verseModel;
  final bool isPlaying;
  final bool isFavorite;
  final bool isBookmark;
  final Function(VerseModel verseModel, bool isPlaying) playFunction;
  final Function(VerseModel verseModel, bool isFavorite) favoriteFunction;
  final Function(
          EBookMarkType bookMarkType, VerseModel verseModel, bool isBookmark)
      bookmarkFunction;
  final Function(VerseModel) shareFunction;
  final Function(String? selectedVerseKey) changeSelectedVerseKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        changeSelectedVerseKey(verseModel.verseKey);
        RenderBox box =
            globalKey.currentContext?.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        await showMenu(
          context: context,
          color: context.theme.cardColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          position: RelativeRect.fromRect(
            Rect.fromLTWH(
                position.dx + kSizeM,
                position.dy + (box.paintBounds.size.height - 200 - kSizeM),
                0,
                0),
            Rect.fromLTWH(
                0, 0, box.paintBounds.size.width, box.paintBounds.size.height),
          ),
          items: [
            PopupMenuItem(
              onTap: () => playFunction(verseModel, isPlaying),
              child: VerseMenuItem(
                iconPath:
                    isPlaying ? ImageConstants.pauseIcon : ImageConstants.play,
                buttonName: isPlaying
                    ? context.translate.pause
                    : context.translate.play,
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
              onTap: () =>
                  bookmarkFunction(EBookMarkType.verse, verseModel, isBookmark),
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
        changeSelectedVerseKey(null);
      },
      child: child,
    );
  }
}
