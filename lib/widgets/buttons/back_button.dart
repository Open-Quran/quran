import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/images.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: SvgPicture.asset(ImageConstants.arrowBack,
            height: 18, color: context.theme.appBarTheme.iconTheme!.color),
      ),
    );
  }
}
