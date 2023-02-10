import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SpeedPopupMenu extends StatelessWidget {
  const SpeedPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
      offset: const Offset(50, -300),
      padding: EdgeInsets.zero,
      itemBuilder: (context) {
        return [
          ..._backItem(
            context: context,
            onTap: () {},
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "0.5",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "0.75",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "Normal",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "1.25",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "1.5",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "1.75",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "2",
          ),
        ];
      },
      child: Row(
        children: [
          SvgPicture.asset(
            ImageConstants.play,
            width: 20,
            color: const Color(0xFFB9B9B9),
          ),
          const SizedBox(width: 10),
          Text(
            context.translate.speed,
            style: context.theme.textTheme.titleLarge?.copyWith(color: const Color(0xFFB9B9B9)),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_right_rounded,
                color: Color(0xFFB9B9B9),
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem _popupMenuItem({
    required BuildContext context,
    required String itemTitle,
  }) {
    return PopupMenuItem(
      height: 45,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        var isActive = context.watch<PlayerProvider>().playerSpeedTitle == itemTitle;
        return InkWell(
          onTap: () => context.read<PlayerProvider>().setPlaybackRate(itemTitle),
          child: Container(
            decoration: isActive
                ? BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(10),
                  )
                : null,
            padding: const EdgeInsets.all(9),
            child: Row(
              children: [
                isActive
                    ? SvgPicture.asset(
                        ImageConstants.okayBorderIcon,
                        width: 20,
                      )
                    : const SizedBox(width: 20),
                const SizedBox(width: 10),
                Text(
                  itemTitle,
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    color: isActive ? null : const Color(0xFFB9B9B9),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  List<PopupMenuItem> _backItem({
    required BuildContext context,
    required Function() onTap,
  }) {
    return [
      PopupMenuItem(
        height: 45,
        onTap: onTap,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          padding: const EdgeInsets.all(9),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF333333),
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
                child: Icon(
                  Icons.arrow_left_rounded,
                  color: Color(0xFFB9B9B9),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                context.translate.speed,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  color: const Color(0xFFB9B9B9),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
