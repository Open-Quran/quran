import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/search_provider.dart';

/// Custom search bar
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: kSizeXL, right: kSizeL, left: kSizeL),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.only(left: kSizeL, right: kSizeM),
          child: buildSearchTextField(context),
        ),

        /// ToDo: Can be added later
        // context.watch<HomeProvider>().toggleSearchOptions.index == 1
        //     ? context.watch<SearchProvider>().buildSearchTags
        //     : const SizedBox(),
      ],
    );
  }

  /// Search bar's text-field
  TextField buildSearchTextField(BuildContext context) {
    return TextField(
      onSubmitted: context.read<SearchProvider>().handleSearchSubmitted,
      controller: context.watch<SearchProvider>().textEditingController,
      focusNode: context.read<SearchProvider>().searchBarFocusNode,
      decoration: InputDecoration(
        suffixIcon: const CancelIcon(),
        suffixIconColor: Colors.white,
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 45, maxWidth: 45),
        border: InputBorder.none,
        hintText: context.translate.searchSurahJuzOrPage,
        hintStyle: context.theme.textTheme.titleLarge
            ?.copyWith(color: AppColors.grey5),
      ),
      cursorColor: AppColors.white,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}

/// Clear icon in search bar
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
        height: 25,
      ),
    );
  }
}
