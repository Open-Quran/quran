import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/images.dart';

class ActionCard extends StatelessWidget {
  const ActionCard(
      {Key? key,
      required this.playButtonOnTap,
      required this.favoriteButtonOnTap,
      required this.bookmarkButtonOnTap,
      required this.settingsButtonOnTap,
      this.ayatNo})
      : super(key: key);

  final String? ayatNo;
  final Function() playButtonOnTap;
  final Function() favoriteButtonOnTap;
  final Function() bookmarkButtonOnTap;
  final Function() settingsButtonOnTap;

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
              ayatNo == null
                  ? const SizedBox()
                  : Text(
                      ayatNo!,
                      style: context.theme.textTheme.titleMedium,
                    ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: playButtonOnTap,
                child: SvgPicture.asset(ImageConstants.playActiveIcon,
                    color: context.theme.iconTheme.color),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: favoriteButtonOnTap,
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: context.theme.iconTheme.color,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: bookmarkButtonOnTap,
                child: SvgPicture.asset(ImageConstants.bookmarkActiveIcon,
                    color: context.theme.iconTheme.color),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(ImageConstants.shareAppIcon,
                    color: context.theme.iconTheme.color),
              )
            ],
          ),
          GestureDetector(
            onTap: settingsButtonOnTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.more_horiz_outlined,
                color: context.theme.iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
