import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Function()? onTap;
  final double? bottomHeight;
  final double? elevation;

  EmptyAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.onTap,
    this.bottomHeight,
    this.elevation,
  })  : preferredSize = const Size.fromHeight(75.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      title: Text(
        title,
        style: context.theme.textTheme.headlineMedium,
      ),
      leading: leading,
      actions: actions,
      bottom: bottom,
    );
  }
}
