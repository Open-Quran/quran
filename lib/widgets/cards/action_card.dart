import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_open_quran/constants/constants.dart';

class ActionCard extends StatelessWidget {
  const ActionCard(
      {Key? key,
      required this.playButtonOnTap,
      this.favoriteButtonOnTap,
      this.bookmarkButtonOnTap,
      this.copyButtonOnTap,
      this.shareButtonOnTap,
      this.isPlaying = false,
      this.isFavorite,
      this.isBookmark = false,
      this.isShowMoreButton = true,
      this.verseKey})
      : super(key: key);

  final String? verseKey;
  final bool isPlaying;
  final bool? isFavorite;
  final bool isBookmark;
  final bool isShowMoreButton;
  final Function(bool isPlaying) playButtonOnTap;
  final Function()? favoriteButtonOnTap;
  final Function()? bookmarkButtonOnTap;
  final Function()? copyButtonOnTap;
  final Function()? shareButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color?.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              verseKey == null
                  ? const SizedBox()
                  : Text(
                      verseKey!,
                      style: context.theme.textTheme.titleMedium,
                    ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => playButtonOnTap(isPlaying),
                child: SvgPicture.asset(
                  isPlaying
                      ? ImageConstants.stopActiveIcon
                      : ImageConstants.playActiveIcon,
                  color: context.theme.iconTheme.color,
                ),
              ),
              const SizedBox(width: 10),
              isFavorite == null
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: favoriteButtonOnTap,
                      child: Icon(
                        isFavorite!
                            ? Icons.favorite_outlined
                            : Icons.favorite_border_outlined,
                        color: context.theme.iconTheme.color,
                      ),
                    ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: bookmarkButtonOnTap,
                child: SvgPicture.asset(
                  isBookmark
                      ? ImageConstants.bookmarkActiveIcon
                      : ImageConstants.bookmarkInactiveIcon,
                  color: context.theme.iconTheme.color,
                ),
              ),
            ],
          ),
          Visibility(
            visible: isShowMoreButton,
            child: PopupMenuButton<String>(
              icon: Icon(
                Icons.more_horiz_outlined,
                color: context.theme.iconTheme.color,
              ),
              elevation: 0,
              color: context.theme.toggleButtonsTheme.selectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSizeM),
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  onTap: copyButtonOnTap,
                  child: Row(
                    children: [
                      Icon(
                        Icons.copy_outlined,
                        color:
                            context.theme.toggleButtonsTheme.textStyle?.color,
                      ),
                      const SizedBox(width: kSizeM),
                      Text(
                        context.translate.copy,
                        style: context.theme.textTheme.titleLarge?.copyWith(
                            color: context
                                .theme.toggleButtonsTheme.textStyle?.color),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  onTap: shareButtonOnTap,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImageConstants.shareAppIcon,
                        color:
                            context.theme.toggleButtonsTheme.textStyle?.color,
                      ),
                      const SizedBox(width: kSizeM),
                      Text(
                        context.translate.share,
                        style: context.theme.textTheme.titleLarge?.copyWith(
                            color: context
                                .theme.toggleButtonsTheme.textStyle?.color),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
