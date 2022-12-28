import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
                const SizedBox(height: kPaddingL),
                SvgPicture.asset(ImageConstants.basmalaIcon),
              ],
            ),
          ),
          const SizedBox(height: kPadding3XL),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SvgPicture.asset(ImageConstants.titleFrame),
        Text(
          surahName(context),
          style: context.theme.textTheme.headlineLarge?.copyWith(
            color: AppColors.grey,
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
