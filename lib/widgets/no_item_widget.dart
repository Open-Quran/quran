import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({Key? key, required this.text, required this.icon})
      : super(key: key);

  /// Empty Search Icon
  final Widget icon;

  /// Empty Search Label
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const Gap(24),
          Opacity(
            opacity: 0.8,
            child: Text(
              text,
              style: context.theme.textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
