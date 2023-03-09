import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../constants/images.dart';
import '../constants/padding.dart';
import '../providers/quran_provider.dart';

class BasmalaTitle extends StatelessWidget {
  final String verseKey;

  const BasmalaTitle({Key? key, required this.verseKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isTitleVisible,
      child: Column(
        children: [
          buildTitle(context),
          Visibility(
            visible: isBasmalaVisible,
            child: Column(
              children: [
                const SizedBox(height: kSizeL),
                SvgPicture.asset(ImageConstants.basmalaIcon,
                    color: context
                        .watch<QuranProvider>()
                        .surahDetailsPageThemeColor
                        .textColor),
              ],
            ),
          ),
          const SizedBox(height: kSize3XL),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SvgPicture.asset(ImageConstants.titleFrame,
            color: context
                .watch<QuranProvider>()
                .surahDetailsPageThemeColor
                .titleVectorColor),
        Text(
          surahName(context),
          style: context.theme.textTheme.headlineLarge?.copyWith(
            color: context
                .watch<QuranProvider>()
                .surahDetailsPageThemeColor
                .textColor,
            letterSpacing: 0.04,
          ),
        ),
      ],
    );
  }

  /// Returning surah name
  String surahName(BuildContext context) {
    var list = verseKey.split(':');
    int index = int.parse(list.first);
    return context.read<QuranProvider>().surahs[index - 1].nameSimple ?? "";
  }

  /// İs Title Visible
  bool get isTitleVisible {
    var list = verseKey.split(':');
    if (list[1] == "1") return true;
    return false;
  }

  /// Remove basmala title from some surahs ex: surah Tawbah
  bool get isBasmalaVisible {
    var list = verseKey.split(':');
    if (list[1] == "1" && verseKey != "9:1" && verseKey != "1:1") return true;
    return false;
  }
}
