import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TranslationReadingSegmentedButton extends StatelessWidget {
  const TranslationReadingSegmentedButton({
    Key? key,
    required this.initialIndex,
    required this.onValueChanged,
  }) : super(key: key);

  final int initialIndex;
  final Function(int index) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: context
            .watch<QuranProvider>()
            .surahDetailsPageThemeColor
            .switchBackgroundColor,
        thumbColor: context
            .watch<QuranProvider>()
            .surahDetailsPageThemeColor
            .switchSelectColor,
        padding: const EdgeInsets.all(3),
        groupValue: initialIndex,
        children: {
          0: SizedBox(
            height: 40,
            child: Center(
              child: Text(
                context.translate.translation,
                style: context.theme.textTheme.headlineSmall?.copyWith(
                    color: initialIndex == 0
                        ? context
                            .watch<QuranProvider>()
                            .surahDetailsPageThemeColor
                            .textColor
                        : context
                            .watch<QuranProvider>()
                            .surahDetailsPageThemeColor
                            .switchUnselectTextColor),
              ),
            ),
          ),
          1: SizedBox(
            height: 40,
            child: Center(
              child: Text(
                context.translate.reading,
                style: context.theme.textTheme.headlineSmall?.copyWith(
                    color: initialIndex == 1
                        ? context
                            .watch<QuranProvider>()
                            .surahDetailsPageThemeColor
                            .textColor
                        : context
                            .watch<QuranProvider>()
                            .surahDetailsPageThemeColor
                            .switchUnselectTextColor),
              ),
            ),
          ),
        },
        onValueChanged: (value) {
          if (value == null) return;
          onValueChanged(value);
        },
      ),
    );
  }
}
