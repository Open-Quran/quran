import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/enums.dart';
import '../../constants/images.dart';

class JuzListToggleButton extends StatelessWidget {
  final EJuzListType listType;
  final Function(EJuzListType)? onChanged;

  const JuzListToggleButton(
      {super.key, required this.listType, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      backgroundColor: AppColors.black2,
      thumbColor: AppColors.black5,
      padding: const EdgeInsets.all(2),
      groupValue: listType.index,
      children: {
        0: SvgPicture.asset(
          ImageConstants.listIcon,
          color:
              listType == EJuzListType.list ? AppColors.grey : AppColors.black7,
        ),
        1: SvgPicture.asset(
          ImageConstants.gridIcon,
          color:
              listType == EJuzListType.grid ? AppColors.grey : AppColors.black7,
        ),
      },
      onValueChanged: (value) {
        if (value == null || onChanged == null) return;
        var result = listType == EJuzListType.list
            ? EJuzListType.grid
            : EJuzListType.list;
        onChanged!(result);
      },
    );
  }
}
