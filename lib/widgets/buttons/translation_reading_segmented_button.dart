import 'package:flutter/cupertino.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/colors.dart';

class TranslationReadingSegmentedButton extends StatelessWidget {
  const TranslationReadingSegmentedButton({
    Key? key,
    required this.initialIndex,
    required this.onValueChanged,
  }) : super(key: key);

  final int initialIndex;
  final Function(int index) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: AppColors.black,
        thumbColor: AppColors.black3,
        padding: const EdgeInsets.all(3),
        groupValue: initialIndex,
        children: {
          0: SizedBox(
            height: 40,
            child: Center(
              child: Text(
                context.translate.translation,
                style: context.theme.textTheme.headlineSmall?.copyWith(
                    color:
                        initialIndex == 0 ? AppColors.grey : AppColors.grey3),
              ),
            ),
          ),
          1: SizedBox(
            height: 40,
            child: Center(
              child: Text(
                context.translate.reading,
                style: context.theme.textTheme.headlineSmall?.copyWith(
                    color:
                        initialIndex == 1 ? AppColors.grey : AppColors.grey3),
              ),
            ),
          ),
        },
        onValueChanged: (value) {
          if (value == null) return;
          onValueChanged(value);
        },
      ),
    );
  }
}
