import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: context.theme.dividerColor),
          ),
        ),
        child: Column(),
      ),
    );
  }
}
