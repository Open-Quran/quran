import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../title.dart';

class SoundDropDown extends StatefulWidget {
  const SoundDropDown({Key? key}) : super(key: key);

  @override
  State<SoundDropDown> createState() => _SoundDropDownState();
}

class _SoundDropDownState extends State<SoundDropDown> {
  List<String> sounds = [
    'Mohmoud Al Husary',
    'Mahir il-Muaykili',
    'Suud eş-Şureym',
    'Abdurrahman es-Sudais',
    'Mahir Bin Hamad Al-Muaiqly'
  ];
  String selectedSound = 'Mohmoud Al Husary';
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        selectedSound = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.sound,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: kPaddingM, bottom: kPaddingXXL),
          decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: DropdownButtonFormField(
            dropdownColor: AppColors.black,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(right: kPaddingL, left: kPaddingM),
            ),
            value: selectedSound,
            items: sounds.map<DropdownMenuItem<String>>((String mascot) {
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
