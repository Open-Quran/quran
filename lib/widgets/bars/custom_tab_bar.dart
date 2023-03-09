import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;

  const CustomTabBar(
      {Key? key, required this.tabTitles, required this.tabViews})
      : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentIndex = 0;

  changeCurrentIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabTitles.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTabBar(context),
          widget.tabViews[currentIndex],
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
            ...widget.tabTitles.map(
              (e) => Tab(
                icon: Text(
                  e,
                  style: context.theme.tabBarTheme.labelStyle,
                ),
              ),
            ),
          ],
          onTap: changeCurrentIndex,
        ),
      ],
    );
  }
}
