import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon( Icons.more_vert,
        color: context.theme.appBarTheme.iconTheme!.color,),
      onPressed: onTap,
    );
  }
}
