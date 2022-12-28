import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/cupertino.dart';

import '../title.dart';

class TranslationOptionsToggleButton extends StatelessWidget {
  final ETranslationOptions listType;
  final Function(ETranslationOptions)? onChanged;
  const TranslationOptionsToggleButton(
      {super.key, required this.listType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.translation,
        ),
        Container(
          margin: const EdgeInsets.only(
              top: kPaddingM, bottom: kPaddingXXL, right: kPaddingXXL),
          width: double.infinity,
          child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: AppColors.black,
            thumbColor: AppColors.black3,
            padding: const EdgeInsets.all(2),
            groupValue: listType.index,
            children: {
              0: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    context.translate.hide,
                    style: listType == EReadOptions.surah
                        ? context.theme.textTheme.bodyMedium
                        : context.theme.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.grey3),
                  ),
                ),
              ),
              1: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    context.translate.show,
                    style: listType == EReadOptions.translation
                        ? context.theme.textTheme.bodyMedium
                        : context.theme.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.grey3),
                  ),
                ),
              ),
            },
            onValueChanged: (value) {
              if (value == null || onChanged == null) return;
              onChanged!(ETranslationOptions.values.elementAt(value));
            },
          ),
        ),
      ],
    );
  }
}
