import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';
import 'package:the_open_quran/widgets/title.dart';

class SurahSizeSlider extends StatelessWidget {
  const SurahSizeSlider(
      {Key? key,
      required this.size,
      required this.onChanged,
      this.isPopUp = false})
      : super(key: key);

  final double size;
  final Function(double newSize) onChanged;
  final bool isPopUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(titleText: context.translate.fontSize),
        Container(
          margin: EdgeInsets.only(
            top: Utils.isSmallPhone(context) ? 10 : kSizeM,
            bottom: Utils.isSmallPhone(context) ? 10 : kSizeL,
          ),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: isPopUp && Utils.isSmallPhone(context)
              ? 40
              : Utils.isMediumPhone(context) && isPopUp
                  ? 45
                  : 50,
          child: Padding(
            padding: const EdgeInsets.all(kSizeL),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: SliderTheme(
                    data: context.theme.sliderTheme.copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius:
                              Utils.isSmallPhone(context) ? 10 : 10),
                    ),
                    child: Slider(
                      value: size.toDouble(),
                      min: 1.0,
                      max: 2.0,
                      onChanged: onChanged,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  size.toString().substring(0, 3),
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.grey3,
                    fontSize: Utils.isSmallPhone(context) ? 10 : 12,
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
