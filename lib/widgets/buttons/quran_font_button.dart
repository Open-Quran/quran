import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../title.dart';

class QuranFontButton extends StatelessWidget {
  const QuranFontButton(
      {super.key,
      required this.selectedFont,
      required this.onChangeArabicFont});

  final String selectedFont;
  final Function(String) onChangeArabicFont;

  void dropdownCallback(String? selectedValue) {
    if (selectedValue == null) return;
    onChangeArabicFont(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.quranFont,
        ),
        Container(
          width: Utils.isSmallPhone(context) ? 120 : 120,
          height: Utils.isSmallPhone(context)
              ? 45
              : Utils.isMediumPhone(context)
                  ? 50
                  : 50,
          margin: EdgeInsets.only(
            top: Utils.isSmallPhone(context) ? 10 : kSizeM,
            bottom: Utils.isSmallPhone(context) ? 10 : kSizeL,
          ),
          decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: DropdownButtonFormField(
              alignment: AlignmentDirectional.topStart,
              dropdownColor: AppColors.black,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(right: kSizeL, left: kSizeM),
              ),
              value: selectedFont,
              items: Fonts.arabicFontNames
                  .map<DropdownMenuItem<String>>((String mascot) {
                return DropdownMenuItem<String>(
                    value: mascot, child: Text(mascot));
              }).toList(),
              onChanged: dropdownCallback,
              style: context.theme.textTheme.bodyMedium,
              isExpanded: true,
              icon: SvgPicture.asset(ImageConstants.dropDownIcon),
            ),
          ),
        ),
      ],
    );
  }
}
