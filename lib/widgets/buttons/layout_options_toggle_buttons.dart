import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../title.dart';

class LayoutOptionsToggleButton extends StatelessWidget {
  final ELayoutOptions listType;
  final Function(ELayoutOptions)? onChanged;
  const LayoutOptionsToggleButton(
      {super.key, required this.listType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.layout,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: kPaddingM,
            bottom: kPaddingXXL,
          ),
          width: double.infinity,
          child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: AppColors.black,
            thumbColor: AppColors.black3,
            padding: const EdgeInsets.all(2),
            groupValue: listType.index,
            children: {
              0: SizedBox(
                height: 45,
                child: SvgPicture.asset(
                  ImageConstants.alignRight,
                  color: listType == ELayoutOptions.alignRight
                      ? AppColors.white5
                      : AppColors.grey3,
                ),
              ),
              1: SizedBox(
                height: 45,
                child: SvgPicture.asset(
                  ImageConstants.justify,
                  color: listType == ELayoutOptions.justify
                      ? AppColors.white5
                      : AppColors.grey3,
                ),
              ),
            },
            onValueChanged: (value) {
              if (value == null || onChanged == null) return;
              onChanged!(ELayoutOptions.values.elementAt(value));
            },
          ),
        ),
      ],
    );
  }
}
