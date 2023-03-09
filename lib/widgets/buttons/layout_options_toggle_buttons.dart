import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/enums.dart';
import '../title.dart';

class LayoutOptionsToggleButton extends StatelessWidget {
  final ELayoutOptions layoutOptions;
  final Function(ELayoutOptions layoutOptions) onChanged;
  final bool isPopUp;

  const LayoutOptionsToggleButton({
    super.key,
    required this.layoutOptions,
    required this.onChanged,
    this.isPopUp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTitle(titleText: context.translate.layout),
        Container(
          margin: EdgeInsets.only(
            top: Utils.isSmallPhone(context) ? 10 : kSizeM,
            bottom: Utils.isSmallPhone(context) ? 10 : kSizeL,
          ),
          height: Utils.isSmallPhone(context)
              ? 45
              : Utils.isMediumPhone(context)
                  ? 50
                  : 50,
          width: isPopUp ? 120 : 120,
          child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: AppColors.black,
            thumbColor: AppColors.black3,
            padding: const EdgeInsets.all(2),
            groupValue: layoutOptions.index,
            children: {
              0: SizedBox(
                height: Utils.isSmallPhone(context) ? 40 : 45,
                child: SvgPicture.asset(
                  ImageConstants.alignRight,
                  color: layoutOptions == ELayoutOptions.right
                      ? AppColors.white5
                      : AppColors.grey3,
                ),
              ),
              1: SizedBox(
                height: Utils.isSmallPhone(context) ? 40 : 45,
                child: SvgPicture.asset(
                  ImageConstants.alignJustify,
                  color: layoutOptions == ELayoutOptions.justify
                      ? AppColors.white5
                      : AppColors.grey3,
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
