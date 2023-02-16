import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../constants/padding.dart';
import '../../providers/quran_provider.dart';
import '../juz_category_list_widget.dart';

class JuzList extends StatelessWidget {
  const JuzList(
      {Key? key,
      required this.onTapJuzCard,
      required this.onTapSurahCard,
      required this.juzListType,
      required this.changeListType})
      : super(key: key);

  /// Juz card onTap
  final Function(int) onTapJuzCard;

  /// Surah card onTap
  final Function(int) onTapSurahCard;

  /// Change list type grid/list
  final Function(EJuzListType) changeListType;

  /// Juz list type index
  final EJuzListType juzListType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSizeL),
      child: JuzCategoryListWidget(
        juzList: context.watch<QuranProvider>().juzList,
        listType: juzListType,
        onChangedListType: changeListType,
        onTapGridCard: (int juzId) {
          onTapJuzCard(juzId);
        },
        onTapSurahCard: (int surahId) {
          onTapSurahCard(surahId);
        },
      ),
    );
  }
}
