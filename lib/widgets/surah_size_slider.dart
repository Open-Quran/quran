import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/title.dart';
import 'package:flutter/cupertino.dart';

class SurahSizeSlider extends StatelessWidget {
  const SurahSizeSlider({Key? key, required this.size, required this.onChanged}) : super(key: key);

  final double size;
  final Function(double newSize) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(titleText: context.translate.surahSize),
        Container(
          margin: const EdgeInsets.only(top: kPaddingM, bottom: kPaddingXXL),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(kPaddingL),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: CupertinoSlider(
                    activeColor: AppColors.white,
                    value: size.toDouble(),
                    min: 1.0,
                    max: 2.0,
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  size.toString().substring(0, 3),
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.grey3,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
