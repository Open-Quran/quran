import 'package:flutter/cupertino.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/enums.dart';
import '../title.dart';

class ReadOptionsToggleButton extends StatelessWidget {
  const ReadOptionsToggleButton(
      {super.key,
      required this.listType,
      required this.onValueChanged,
      this.isPopUp = false});

  final EReadOptions listType;
  final Function(EReadOptions eReadOptions) onValueChanged;
  final bool isPopUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(titleText: context.translate.read),
        Container(
          margin: EdgeInsets.only(
            top: Utils.isSmallPhone(context) ? 10 : kSizeM,
            bottom: Utils.isSmallPhone(context) ? 10 : kSizeL,
          ),
          width: double.infinity,
          child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: AppColors.black,
            thumbColor: AppColors.black3,
            padding: const EdgeInsets.all(2),
            groupValue: listType.index,
            children: {
              0: SizedBox(
                height: isPopUp && Utils.isSmallPhone(context)
                    ? 30
                    : Utils.isMediumPhone(context) && isPopUp
                        ? 40
                        : 50,
                child: Center(
                  child: Text(
                    context.translate.ayat,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: listType == EReadOptions.surah
                            ? null
                            : AppColors.grey3,
                        fontSize: isPopUp && Utils.isSmallPhone(context)
                            ? 10
                            : Utils.isMediumPhone(context) && isPopUp
                                ? 12
                                : 14),
                  ),
                ),
              ),
              1: SizedBox(
                height: isPopUp && Utils.isSmallPhone(context)
                    ? 30
                    : Utils.isMediumPhone(context) && isPopUp
                        ? 40
                        : 50,
                child: Center(
                  child: Text(
                    context.translate.translation,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: listType == EReadOptions.translation
                            ? null
                            : AppColors.grey3,
                        fontSize: isPopUp && Utils.isSmallPhone(context)
                            ? 10
                            : Utils.isMediumPhone(context) && isPopUp
                                ? 12
                                : 14),
                  ),
                ),
              ),
              2: SizedBox(
                height: isPopUp && Utils.isSmallPhone(context)
                    ? 30
                    : Utils.isMediumPhone(context) && isPopUp
                        ? 40
                        : 50,
                child: Center(
                  child: Text(
                    context.translate.ayatAndTranslation,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: listType == EReadOptions.surahAndTranslation
                            ? null
                            : AppColors.grey3,
                        fontSize: isPopUp && Utils.isSmallPhone(context)
                            ? 10
                            : Utils.isMediumPhone(context) && isPopUp
                                ? 11
                                : 12),
                  ),
                ),
              ),
            },
            onValueChanged: (value) {
              if (value == null) return;
              onValueChanged(EReadOptions.values.elementAt(value));
            },
          ),
        ),
      ],
    );
  }
}
