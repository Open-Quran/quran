import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/provider/home_provider.dart';
import 'package:fabrikod_quran/widgets/bars/main_app_bar.dart';
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
        appBar: MainAppBar(title: context.translate.quranKerim),
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
          const SizedBox(height: kPaddingDefault * 2),
          Expanded(child: buildDefaultTabController),
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

  Widget get buildDefaultTabController {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          buildTabBar,
          Expanded(child: buildTabBarView),
        ],
      ),
    );
  }

  List<String> get getTabTitles => [
        context.translate.surah,
        context.translate.juz,
        context.translate.sajda,
      ];

  Widget get buildTabBar {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.theme.dividerColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        TabBar(
          tabs: [
            ...getTabTitles.map(
              (e) => Tab(
                icon: Text(
                  e,
                  style: context.theme.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get buildTabBarView {
    return const TabBarView(
      children: [
        Icon(Icons.flight, size: 350),
        Icon(Icons.directions_transit, size: 350),
        Icon(Icons.directions_car, size: 350),
      ],
    );
  }
}
