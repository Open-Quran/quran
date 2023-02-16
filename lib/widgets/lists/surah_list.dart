import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/padding.dart';
import '../../providers/quran_provider.dart';
import '../cards/surah_card.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key, required this.onTap}) : super(key: key);

  /// Surah card onTap
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    var surahs = context.watch<QuranProvider>().surahs;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: kSizeL),
      itemCount: surahs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return SurahCard(
          surahModel: surah,
          onTap: (){
            onTap(surah.id!);
          }
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: kSizeL),
    );
  }
}
