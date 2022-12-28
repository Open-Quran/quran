import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/cupertino.dart';

import '../title.dart';

class ReadOptionsToggleButton extends StatelessWidget {
  final EReadOptions listType;
  final Function(EReadOptions)? onChanged;
  const ReadOptionsToggleButton(
      {super.key, required this.listType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.read,
        ),
        Container(
          margin: const EdgeInsets.only(top: kPaddingM, bottom: kPaddingXXL),
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
                    context.translate.surah,
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
                    context.translate.translation,
                    style: listType == EReadOptions.translation
                        ? context.theme.textTheme.bodyMedium
                        : context.theme.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.grey3),
                  ),
                ),
              ),
              2: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    context.translate.surahAndTranslation,
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
              onChanged!(EReadOptions.values.elementAt(value));
            },
          ),
        ),
      ],
    );
  }
}
