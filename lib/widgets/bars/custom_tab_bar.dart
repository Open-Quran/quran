import 'package:flutter/material.dart';
import 'package:fabrikod_quran/constants/constants.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;

  const CustomTabBar({Key? key, required this.tabTitles, required this.tabViews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Column(
        children: [
          buildTabBar(context),
          Expanded(child: buildTabBarView),
        ],
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
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
            ...tabTitles.map(
              (e) => Tab(
                icon: Text(
                  e,
                  style: context.theme.tabBarTheme.labelStyle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get buildTabBarView {
    return TabBarView(
      children: tabViews,
    );
  }
}
