import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/home_provider.dart';
import 'package:fabrikod_quran/widgets/bars/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../animation/fade_indexed_stack.dart';

class HomeToggleButton extends StatelessWidget {
  final EHomeToggleOptions toggleListType;
  final Function(EHomeToggleOptions)? onChanged;

  const HomeToggleButton(
      {super.key, required this.toggleListType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controlWidth = screenWidth * 0.83;
    return FadeIndexedStack(
      index: context.read<HomeProvider>().toggleSearchOptions.index,
      children: [
        buildJuzSurahSearchToggles(controlWidth, context),
        SearchBar(),
      ],
    );
  }

  Widget buildJuzSurahSearchToggles(double controlWidth, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildJuzAndSurahToggles(controlWidth, context),
        buildSearchButton(context)
      ],
    );
  }

  Widget buildSearchButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<HomeProvider>()
            .changeToggleSearchOptions(EToggleSearchOptions.searchField);
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.all(kPaddingM),
        decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(7), bottomRight: Radius.circular(7))),
        child: SvgPicture.asset(ImageConstants.searchIcon),
      ),
    );
  }

  Widget buildJuzAndSurahToggles(double controlWidth, BuildContext context) {
    return Container(
      width: controlWidth,
      decoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: AppColors.black,
        thumbColor: AppColors.black5,
        groupValue: toggleListType.index,
        children: {
          0: SizedBox(
            height: 40,
            child: Center(
                child: Text(
              context.translate.juz,
              style: context.theme.textTheme.headlineSmall?.copyWith(
                  color: toggleListType.index == 0
                      ? AppColors.grey
                      : AppColors.grey3),
            )),
          ),
          1: SizedBox(
            height: 40,
            child: Center(
                child: Text(
              context.translate.surah,
              style: context.theme.textTheme.headlineSmall?.copyWith(
                  color: toggleListType.index == 1
                      ? AppColors.grey
                      : AppColors.grey3),
            )),
          ),
        },
        onValueChanged: (value) {
          var result = toggleListType == EHomeToggleOptions.juz
              ? EHomeToggleOptions.surah
              : EHomeToggleOptions.juz;
          onChanged!(result);
        },
      ),
    );
  }
}
