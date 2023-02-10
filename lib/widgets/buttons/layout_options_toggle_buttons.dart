import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../title.dart';

class LayoutOptionsToggleButton extends StatelessWidget {
  final ELayoutOptions layoutOptions;
  final Function(ELayoutOptions layoutOptions) onChanged;

  const LayoutOptionsToggleButton({super.key, required this.layoutOptions, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(titleText: context.translate.layout),
        Container(
          margin: const EdgeInsets.only(
            top: kSizeM,
            bottom: kSizeXXL,
          ),
          width: 150,
          child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: AppColors.black,
            thumbColor: AppColors.black3,
            padding: const EdgeInsets.all(2),
            groupValue: layoutOptions.index,
            children: {
              0: SizedBox(
                height: 45,
                child: SvgPicture.asset(
                  ImageConstants.alignRight,
                  color: layoutOptions == ELayoutOptions.right ? AppColors.white5 : AppColors.grey3,
                ),
              ),
              1: SizedBox(
                height: 45,
                child: SvgPicture.asset(
                  ImageConstants.alignCenter,
                  color: layoutOptions == ELayoutOptions.center ? AppColors.white5 : AppColors.grey3,
                ),
              ),
            },
            onValueChanged: (value) {
              if (value == null) return;
              onChanged(ELayoutOptions.values.elementAt(value));
            },
          ),
        ),
      ],
    );
  }
}
