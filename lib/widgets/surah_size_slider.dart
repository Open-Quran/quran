import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/title.dart';
import 'package:flutter/cupertino.dart';

class SurahSizeSlider extends StatefulWidget {
  const SurahSizeSlider({Key? key}) : super(key: key);

  @override
  State<SurahSizeSlider> createState() => _SurahSizeSliderState();
}

class _SurahSizeSliderState extends State<SurahSizeSlider> {
  int surahSize = 16;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.surahSize,
        ),
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
                      value: surahSize.toDouble(),
                      min: 8,
                      max: 32,
                      onChanged: (newRating) {
                        setState(() {
                          surahSize = newRating.round();
                        });
                      }),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  surahSize.toInt().toString(),
                  style: context.theme.textTheme.labelSmall
                      ?.copyWith(color: AppColors.grey3, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
