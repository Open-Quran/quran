import 'dart:io';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Function()? onPressed;
  final double? bottomHeight;
  final double? elevation;

  CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.onPressed,
    this.bottomHeight,
    this.elevation,
  })  : preferredSize = bottom != null
            ? Size.fromHeight(Platform.isIOS ? 60.0 : 70.0 + bottomHeight!)
            : Size.fromHeight(Platform.isIOS ? 60.0 : 70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Platform.isIOS ? 60 : 70,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 6 : 0),
        child: Text(
          title!.toUpperCase(),
        ),
      ),
      leading: leading,
      actions: actions,
      bottom: bottom ??
          PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                color: Theme.of(context).dividerColor,
                height: 1,
              )),
      automaticallyImplyLeading: false,
    );
  }
}
