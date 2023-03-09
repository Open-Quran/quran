import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool isDrawerOpen;
  final PreferredSizeWidget? bottom;
  final Function()? onTap;
  final double? bottomHeight;
  final double? elevation;

  CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.isDrawerOpen = false,
    this.bottom,
    this.onTap,
    this.bottomHeight,
    this.elevation,
  })  : preferredSize = bottom != null
            ? Size.fromHeight(bottomHeight!)
            : const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Platform.isIOS ? 60 : 70,
      centerTitle: false,
      titleSpacing: 5,
      title: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 6 : 0),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(title, style: context.theme.appBarTheme.titleTextStyle),
              Icon(
                isDrawerOpen ? Icons.arrow_left : Icons.arrow_right,
                size: 25,
              )
            ],
          ),
        ),
      ),
      leading: buildBackIconButton(context),
      leadingWidth: 40,
      actions: actions,
      bottom: bottom ??
          PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Theme.of(context).dividerColor,
              height: 1,
            ),
          ),
      automaticallyImplyLeading: false,
    );
  }

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
