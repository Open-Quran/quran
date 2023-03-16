import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/screens/surah_details/surah_details_screen.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/padding.dart';
import '../../providers/surah_details_provider.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String subTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool isDrawerOpen;
  final bool isSettingsOpen;
  final bool isBookmarked;
  final bool isActiveSoundIcon;
  final Function()? onTapTitle;
  final Function(bool) onTapBookmark;
  final Function(bool isPlaying) onTapSound;
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
    this.isSettingsOpen = false,
    this.isBookmarked = false,
    this.isActiveSoundIcon = false,
    this.bottomHeight,
    this.elevation,
    this.onTapTitle,
    required this.onTapBookmark,
    required this.onTapSound,
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
        children: [buildBackIconButton(context), buildBookmarkButton()],
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
        isSettingsOpen ? ImageConstants.settingsIconOpen : ImageConstants.settingsIcon,
        height: 20,
      ),
    );
  }

  /// Sound button
  IconButton buildSoundButton() {
    return IconButton(
      onPressed: () => onTapSound(isActiveSoundIcon),
      icon: SvgPicture.asset(
        isActiveSoundIcon ? ImageConstants.soundIcon : ImageConstants.soundInactiveIcon,
        height: 20,
      ),
    );
  }

  /// Bookmark button
  IconButton buildBookmarkButton() {
    return IconButton(
      onPressed: () => onTapBookmark(isBookmarked),
      icon: SvgPicture.asset(
        isBookmarked ? ImageConstants.bookmarkActiveIcon : ImageConstants.bookmarkIcon,
        height: 20,
      ),
    );
  }

  /// Surah and pages title
  GestureDetector buildAppBarTitle(BuildContext context) {
    return GestureDetector(
        onTap: onTapTitle,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: kSizeS + 3, horizontal: kSizeL),
          decoration: BoxDecoration(
              color: isDrawerOpen ? AppColors.black2 : AppColors.black, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: context.theme.textTheme.headlineLarge,
                  ),
                  Icon(isDrawerOpen ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded)
                ],
              ),
              const Gap(5),
              Text(
                subTitle,
                style: context.theme.textTheme.bodyLarge!
                    .copyWith(color: AppColors.grey.withOpacity(0.80), letterSpacing: 0),
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
        if (isSettingsOpen) {
          context.read<SurahDetailsProvider>().closeSettings();
        } else if (isDrawerOpen) {
          context.read<SurahDetailsProvider>().closeDrawer();
        } else {
          Navigator.of(context).pop();
        }
      },
      icon: SvgPicture.asset(ImageConstants.arrowBack, height: 18, color: context.theme.appBarTheme.iconTheme!.color),
    );
  }
}
