import 'dart:io';

import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String subTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool isDrawerOpen;
  final bool isBookmarked;
  final Function()? onTapMenu;
  final Function()? onTapTitle;
  final Function()? onTapBookmark;
  final Function()? onTapSound;
  final Function()? onTapSettings;
  final double? bottomHeight;
  final double? elevation;

  const SecondaryAppBar({
    Key? key,
    required this.title,
    required this.subTitle,
    this.actions,
    this.leading,
    this.isDrawerOpen = false,
    this.isBookmarked = false,
    this.bottomHeight,
    this.elevation,
    this.onTapMenu,
    this.onTapTitle,
    this.onTapBookmark,
    this.onTapSound,
    this.onTapSettings,
  })  : preferredSize = const Size.fromHeight(75.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Platform.isIOS ? 60 : 70,
      centerTitle: true,
      titleSpacing: 5,
      title: buildAppBarTitle(context),
      leading: Row(
        children: [buildMenuButton(), buildBookmarkButton()],
      ),
      leadingWidth: 100,
      actions: [
        buildSoundButton(),
        buildSettingsButton(),
      ],
      automaticallyImplyLeading: false,
    );
  }

  /// Settings button
  IconButton buildSettingsButton() {
    return IconButton(
      onPressed: onTapSettings,
      icon: SvgPicture.asset(
        ImageConstants.settingsIcon,
        height: 20,
      ),
    );
  }

  /// Sound button
  IconButton buildSoundButton() {
    return IconButton(
      onPressed: onTapSound,
      icon: SvgPicture.asset(
        ImageConstants.soundIcon,
        height: 20,
      ),
    );
  }

  /// Bookmark button
  IconButton buildBookmarkButton() {
    return IconButton(
      onPressed: onTapBookmark,
      icon: SvgPicture.asset(
        isBookmarked
            ? ImageConstants.bookmarkActiveIcon
            : ImageConstants.bookmarkIcon,
        height: 20,
      ),
    );
  }

  /// Menu button
  IconButton buildMenuButton() {
    return IconButton(
      onPressed: onTapMenu,
      icon: SvgPicture.asset(
        ImageConstants.menuIcon,
        height: 20,
      ),
    );
  }

  /// Surah and pages title
  GestureDetector buildAppBarTitle(BuildContext context) {
    return GestureDetector(
        onTap: onTapTitle,
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: kPaddingS + 3, horizontal: kPaddingL + 10),
          decoration: BoxDecoration(
              color: isDrawerOpen ? AppColors.black2 : AppColors.black,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: context.theme.textTheme.headlineLarge,
                  ),
                  Icon(isDrawerOpen
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded)
                ],
              ),
              Text(
                subTitle,
                style: context.theme.textTheme.bodySmall!.copyWith(
                    color: AppColors.grey.withOpacity(0.58), letterSpacing: 0),
              ),
            ],
          ),
        ));
  }

  /// Back navigation button
  IconButton buildBackIconButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(ImageConstants.arrowBack,
          height: 18, color: context.theme.appBarTheme.iconTheme!.color),
    );
  }
}
