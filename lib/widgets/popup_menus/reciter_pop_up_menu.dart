import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/player_provider.dart';

class ReciterPopUpMenu extends StatefulWidget {
  const ReciterPopUpMenu({super.key});

  @override
  State<ReciterPopUpMenu> createState() => _ReciterPopUpMenuState();
}

class _ReciterPopUpMenuState extends State<ReciterPopUpMenu> {
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
          _popupMenuItem(
            context: context,
            itemTitle: "Mohmoud Al Husary",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "Mahir il-Muaykili",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "Suud eş-Şureym",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "Abdurrahman es-Sudais",
          ),
          _popupMenuItem(
            context: context,
            itemTitle: "Mahir Bin Hamad Al-Muaiqly",
          )
        ];
      },
      child: Row(
        children: [
          SvgPicture.asset(
            ImageConstants.favoriteInactiveIcon,
            width: 20,
            color: const Color(0xFFB9B9B9),
          ),
          const SizedBox(width: 10),
          Text(
            context.translate.reciter,
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
        var isActive = context.watch<PlayerProvider>().reciterTitle == itemTitle;
        return InkWell(
          onTap: () => context.read<PlayerProvider>().setReciter(itemTitle),
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
}
