import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberIcon extends StatelessWidget {
  final int number;
  final bool isArabic;
  final double size;

  const NumberIcon(
      {Key? key, required this.number, this.size = 40, this.isArabic = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            ImageConstants.surahNumberFrame,
            color: context.theme.appBarTheme.titleTextStyle?.color,
            height: size,
            width: size,
          ),
          Positioned.fill(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                child: AutoSizeText(
                  isArabic
                      ? Utils.getArabicVerseNo(number.toString())
                      : number.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    color: context.theme.backgroundColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
