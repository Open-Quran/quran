import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/screens/settings_screen.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/padding.dart';
import '../providers/home_provider.dart';
import '../providers/more_provider.dart';
import '../providers/player_provider.dart';
import '../providers/search_provider.dart';
import '../widgets/bars/play_bar.dart';
import '../widgets/cards/slidable_verse_card/slidable_provider.dart';
import 'bookmark_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlayerProvider>().createAudioHandler(context);
  }

  /// Current index of bottom navigation bar
  int currentIndex = 0;

  /// Changes index of bottom navigation Bar
  changeIndex(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeProvider(context), lazy: false),
        ChangeNotifierProvider(create: (_) => MoreProvider(context)),
        ChangeNotifierProvider(create: (_) => SearchProvider(context)),
        ChangeNotifierProvider(create: (_) => SlidableProvider(context)),
      ],
      child: Scaffold(
        body: buildBody,
        bottomNavigationBar: buildBottomNavigationBar,
      ),
    );
  }

  /// Stack pages of the [BottomNavigationBar]
  Widget get buildBody {
    return IndexedStack(
      index: currentIndex,
      children: const [
        HomeScreen(),
        BookmarkScreen(),
        FavoritesScreen(),
        SettingsScreen(),
      ],
    );
  }

  Widget get buildBottomNavigationBar {
    return buildBottomBarBackGround(
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
            icon: ImageConstants.bookmarkInactiveIcon,
            activeIcon: ImageConstants.bookmarkActiveIcon,
          ),
          buildBottomNavigationBarItem(
            icon: ImageConstants.favoriteInactiveIcon,
            activeIcon: ImageConstants.favoriteActiveIcon,
          ),
          buildBottomNavigationBarItem(
            icon: ImageConstants.moreInactiveIcon,
            activeIcon: ImageConstants.moreActiveIcon,
          )
        ],
      ),
    );
  }

  Widget buildBottomBarBackGround({required Widget child}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PlayBar(),
        Container(
          height: 1,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.white.withOpacity(0.07),
              AppColors.white.withOpacity(0.12),
            ],
          )),
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 64.0, sigmaY: 64.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.black4.withOpacity(0.47),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.05),
                    offset: const Offset(0.0, 45.024),
                    blurRadius: 72.36,
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String activeIcon,
  }) {
    double padding = Platform.isIOS ? kSizeM : 0;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: padding),
        child: SvgPicture.asset(
          icon,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: padding),
        child: SvgPicture.asset(
          activeIcon,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
      ),
      label: "",
    );
  }
}
