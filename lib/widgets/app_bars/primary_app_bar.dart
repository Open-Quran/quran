import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Function()? onPressed;
  final double? bottomHeight;
  final double? elevation;

  const PrimaryAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.onPressed,
    this.bottomHeight,
    this.elevation,
  })  : preferredSize = const Size.fromHeight(75.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: AppColors.black,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title.toUpperCase(),
          style: context.theme.textTheme.displayMedium,
        ),
      ),
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }
}
