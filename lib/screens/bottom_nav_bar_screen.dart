import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/screens/home_screen.dart';
import 'package:fabrikod_quran/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  /// Current index of bottom navigation bar
  int currentIndex = 0;

  /// Change current index of bottom navigation Bar
  changeIndex(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody,
      bottomNavigationBar: buildBottomNavigationBar,
    );
  }

  Widget get buildBody {
    return IndexedStack(
      index: currentIndex,
      children: const [
        HomeScreen(),
        MoreScreen(),
      ],
    );
  }

  Widget get buildBottomNavigationBar {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: changeIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          buildBottomNavigationBarItem(
            icon: ImageConstants.homeInactiveIcon,
            activeIcon: ImageConstants.homeActiveIcon,
          ),
          buildBottomNavigationBarItem(
            icon: ImageConstants.moreInactiveIcon,
            activeIcon: ImageConstants.moreActiveIcon,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      ),
      activeIcon: SvgPicture.asset(
        activeIcon,
        color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      ),
      label: "",
    );
  }
}
