import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/widgets/popup_menus/speed_popup_menu.dart';

import '../../constants/images.dart';

class PlayBarMorePopupMenu extends StatelessWidget {
  const PlayBarMorePopupMenu({
    Key? key,
    required this.onTapDownload,
    required this.onTapReciter,
  }) : super(key: key);
  final Function() onTapDownload;
  final Function() onTapReciter;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Padding(
        padding: const EdgeInsets.all(13),
        child: SvgPicture.asset(ImageConstants.moreInactiveIcon),
      ),
      elevation: 0,
      color: const Color(0xFF6B6B6B).withOpacity(0.9),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white.withOpacity(0.16),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      offset: const Offset(0, -180),
      padding: EdgeInsets.zero,
      itemBuilder: (context) {
        return [
          _popupMenuItem(
            context: context,
            itemIconPath: ImageConstants.downloadIcon,
            itemTitle: context.translate.download,
            onTap: onTapDownload,
          ),
          const PopupMenuItem(
            height: 45,
            padding: EdgeInsets.only(left: 15, right: 10),
            child: SpeedPopupMenu(),
          ),
          _popupMenuItem(
            context: context,
            itemIconPath: ImageConstants.favoriteInactiveIcon,
            itemTitle: context.translate.reciter,
            isArrowRight: true,
            onTap: onTapReciter,
          ),
        ];
      },
    );
  }

  PopupMenuItem _popupMenuItem({
    required BuildContext context,
    required String itemIconPath,
    required String itemTitle,
    bool isArrowRight = false,
    required Function() onTap,
  }) {
    return PopupMenuItem(
      height: 45,
      onTap: onTap,
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            itemIconPath,
            width: 20,
            color: const Color(0xFFB9B9B9),
          ),
          const SizedBox(width: 10),
          Text(
            itemTitle,
            style: context.theme.textTheme.titleLarge
                ?.copyWith(color: const Color(0xFFB9B9B9)),
          ),
          Visibility(
            visible: isArrowRight,
            child: const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_right_rounded,
                  color: Color(0xFFB9B9B9),
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
