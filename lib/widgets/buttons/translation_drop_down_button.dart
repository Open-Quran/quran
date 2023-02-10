import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../title.dart';

class TranslationDropDown extends StatefulWidget {
  const TranslationDropDown({Key? key}) : super(key: key);

  @override
  State<TranslationDropDown> createState() => _TranslationDropDownState();
}

class _TranslationDropDownState extends State<TranslationDropDown> {
  List<String> translations = [
    'Turkish Diyanet',
    'Turkish Diyaneasdt',
    'Turkish Diyaneast',
    'Turkish Diyaasdnet',
    'Turkish Diyansadet',
    'Turkish Diysadaanet',
  ];
  String selectedTranslation = 'Turkish Diyanet';
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        selectedTranslation = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.translation,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: kSizeM, bottom: kSizeXXL),
          decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: DropdownButtonFormField(
            dropdownColor: AppColors.black,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(right: kSizeL, left: kSizeM),
            ),
            value: selectedTranslation,
            items: translations.map<DropdownMenuItem<String>>((String mascot) {
              return DropdownMenuItem<String>(
                  value: mascot, child: Text(mascot));
            }).toList(),
            onChanged: dropdownCallback,
            style: context.theme.textTheme.bodyMedium,
            isExpanded: true,
            icon: SvgPicture.asset(ImageConstants.dropDownIcon),
          ),
        ),
      ],
    );
  }
}
