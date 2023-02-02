import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(
          vertical: kPaddingXL, horizontal: kPaddingXL),
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: kPaddingXL),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          onSubmitted: context.read<SearchProvider>().handleSearchSubmitted,
          controller: context.watch<SearchProvider>().textEditingController,
          decoration: InputDecoration(
            suffixIcon: const CancelIcon(),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 20),
            border: InputBorder.none,
            hintText: context.translate.searchSurahJuzOrAyahs,
            hintStyle: context.theme.textTheme.titleLarge
                ?.copyWith(color: AppColors.grey5),
          ),
          cursorColor: AppColors.white,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}

/// Clear search icon
class CancelIcon extends StatelessWidget {
  const CancelIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<SearchProvider>().clearSearchField(context),
      child: SvgPicture.asset(
        ImageConstants.cancelIcon,
      ),
    );
  }
}
