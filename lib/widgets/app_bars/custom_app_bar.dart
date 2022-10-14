import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../buttons/back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Function()? onTap;
  final double? bottomHeight;
  final double? elevation;

  CustomAppBar({
    Key? key,
    required this.title,
    this.bottom,
    this.onTap,
    this.actions,
    this.bottomHeight,
    this.elevation,
  }) : preferredSize = bottom != null
            ? Size.fromHeight(bottomHeight!)
            : const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 1,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomBackButton(),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(title, style: context.theme.appBarTheme.titleTextStyle),
                const Icon(Icons.arrow_right, size: 25,)
              ],
            ),
          ),
        ],
      ),
      actions: actions,
      bottom: bottom,
      automaticallyImplyLeading: false,
      centerTitle: false,
    );
  }
}
