import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButtonRate extends StatelessWidget {
  /// Button label [String]
  final String text;

  /// Button [onPressed] function
  final Function()? onPressed;

  /// Button [icon]
  final Widget icon;

  /// BUtton [endIcon]
  final Widget endIcon;

  const SecondaryButtonRate({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
    required this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPaddingL),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 72),
          backgroundColor: AppColors.black2,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kPaddingM),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: kPaddingXL),
            icon,
            const SizedBox(width: kPaddingXXL),
            Text(
              text,
              style: context.theme.textTheme.headlineSmall
                  ?.copyWith(color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            endIcon,
            const SizedBox(
              width: kPaddingXL,
            )
          ],
        ),
      ),
    );
  }
}
