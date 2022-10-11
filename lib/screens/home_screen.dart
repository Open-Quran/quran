import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:fabrikod_quran/provider/home_provider.dart';
import 'package:fabrikod_quran/widgets/bars/custom_app_bar.dart';
import 'package:fabrikod_quran/widgets/bars/custom_search_bar.dart';
import 'package:fabrikod_quran/widgets/search_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.watch<HomeProvider>().searchBarFocusNodeUnFocus,
      child: Scaffold(
        appBar: CustomAppBar(title: TranslateHelper.of(context)?.quranKerim ?? ""),
        body: buildBody,
      ),
    );
  }

  Widget get buildBody {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal) +
          const EdgeInsets.only(top: kPaddingVertical),
      child: Column(
        children: [
          SvgPicture.asset(ImageConstants.bigBasmalaIcon, color: Theme.of(context).iconTheme.color),
          const SizedBox(height: kPaddingDefault * 2),
          CustomSearchBar(focusNode: context.watch<HomeProvider>().searchBarFocusNode),
          const SizedBox(height: kPaddingDefault),
          buildSearchTags,
        ],
      ),
    );
  }

  Widget get buildSearchTags {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SearchTag(
            title: "Index $index",
            onPressed: () {},
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: kPaddingDefault);
        },
      ),
    );
  }
}
