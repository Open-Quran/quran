import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/search_provider.dart';
import '../animation/fade_indexed_stack.dart';
import '../bars/custom_search_bar.dart';

class JuzSurahSearchToggleButton extends StatelessWidget {
  /// Toggle options Juz or Surah
  final EJuzSurahToggleOptions toggleListType;

  /// Changing toggles VoidCallBack
  /// Takes [EJuzSurahToggleOptions] and changes index
  final Function(EJuzSurahToggleOptions)? onChanged;

  /// Search button onTap
  final Function(EToggleSearchOptions)? onTapSearchButton;

  /// Index of juz/surah and search toggle buttons
  final int toggleSearchButtonIndex;

  const JuzSurahSearchToggleButton({
    super.key,
    required this.toggleListType,
    required this.onChanged,
    required this.toggleSearchButtonIndex,
    required this.onTapSearchButton,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controlWidth = screenWidth * 0.83;
    return FadeIndexedStack(
      index: toggleSearchButtonIndex,
      children: [
        buildJuzSurahSearchToggles(controlWidth, context),
        const CustomSearchBar(),
      ],
    );
  }

  /// Juz/Surah and search button toggles
  Widget buildJuzSurahSearchToggles(double controlWidth, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildJuzAndSurahToggles(controlWidth, context),
        buildSearchButton(context)
      ],
    );
  }

  /// Search button on the right side of home toggles
  Widget buildSearchButton(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapSearchButton!((EToggleSearchOptions.searchField));
        context.read<SearchProvider>().searchBarFocusNode.requestFocus();
      },
      child: Container(
        height: 44,
        width: 44,
        padding: const EdgeInsets.all(kSizeM),
        decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(7))),
        child: SvgPicture.asset(ImageConstants.searchIcon),
      ),
    );
  }

  /// Juz and Surah toggles in the home page
  Widget buildJuzAndSurahToggles(double controlWidth, BuildContext context) {
    return Container(
      width: controlWidth,
      decoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
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
          var result = toggleListType == EJuzSurahToggleOptions.juz
              ? EJuzSurahToggleOptions.surah
              : EJuzSurahToggleOptions.juz;
          onChanged!(result);
        },
      ),
    );
  }
}
