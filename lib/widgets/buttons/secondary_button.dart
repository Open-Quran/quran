import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Widget icon;
  const SecondaryButton(
      {super.key, required this.text, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 60),
        backgroundColor: context.theme.cardTheme.color?.withOpacity(0.1),
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(kPaddingHorizontal),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kPaddingDefault),
        ),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: kPaddingDefault),
          Text(
            text,
            style: context.theme.tabBarTheme.labelStyle,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
