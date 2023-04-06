import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../models/surah_model.dart';
import 'animation/fade_indexed_stack.dart';
import 'buttons/juz_list_toggle_button.dart';
import 'cards/grid_card.dart';
import 'cards/surah_card.dart';

class JuzCategoryListWidget extends StatefulWidget {
  final List<List<SurahModel>> juzList;
  final EJuzListType listType;
  final Function(EJuzListType newListType) onChangedListType;
  final Function(int juzId) onTapGridCard;
  final Function(int surahId) onTapSurahCard;

  const JuzCategoryListWidget({
    Key? key,
    required this.juzList,
    this.listType = EJuzListType.list,
    required this.onChangedListType,
    required this.onTapGridCard,
    required this.onTapSurahCard,
  }) : super(key: key);

  @override
  State<JuzCategoryListWidget> createState() => _JuzCategoryListWidgetState();
}

class _JuzCategoryListWidgetState extends State<JuzCategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate.juz,
              style: context.theme.textTheme.displayLarge?.copyWith(letterSpacing: 0.4),
            ),
            JuzListToggleButton(
              listType: widget.listType,
              onChanged: widget.onChangedListType,
            )
          ],
        ),
        FadeIndexedStack(
          index: widget.listType.index,
          children: [
            buildJuzList(),
            buildJuzGridList(),
          ],
        ),
      ],
    );
  }

  /// The grid of the Juz list
  Widget buildJuzGridList() {
    return GridView.builder(
      itemCount: widget.juzList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kSizeL),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: kSizeM,
        crossAxisSpacing: kSizeM,
      ),
      itemBuilder: (context, index) {
        int juzId = index + 1;
        return GridCard(
          text: juzId.toString(),
          onTap: () => widget.onTapGridCard(juzId),
        );
      },
    );
  }

  /// The Juz list
  Widget buildJuzList() {
    return ListView.builder(
      itemCount: widget.juzList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: kSizeL),
      itemBuilder: (context, juzIndex) {
        int juzId = juzIndex + 1;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: kSizeL),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSizeM),
                color: AppColors.black3,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${context.translate.juz} $juzId",
                  style: context.theme.textTheme.headlineSmall?.copyWith(color: AppColors.grey),
                ),
              ),
            ),
            const SizedBox(height: kSizeM),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, surahIndex) {
                final surah = widget.juzList[juzIndex][surahIndex];
                return SurahCard(
                  surahModel: surah,
                  onTap: () => widget.onTapSurahCard(surah.id ?? 1),
                );
              },
              separatorBuilder: (context, surahIndex) => const SizedBox(height: kSizeL),
              itemCount: widget.juzList[juzIndex].length,
            ),
            const SizedBox(height: kSizeXL)
          ],
        );
      },
    );
  }
}
