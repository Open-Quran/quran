import 'package:fabrikod_quran/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CustomDrawerScaffold extends StatefulWidget {
  final String? appBarTitle;
  final Widget? body;
  final Widget? drawer;
  final Function()? onTapMore;

  const CustomDrawerScaffold({
    Key? key,
    this.appBarTitle,
    this.body,
    this.drawer,
    this.onTapMore,
  }) : super(key: key);

  @override
  State<CustomDrawerScaffold> createState() => _CustomDrawerScaffoldState();
}

class _CustomDrawerScaffoldState extends State<CustomDrawerScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Function For Change State Of Drawer
  void changeStateOfDrawer() {
    if (_scaffoldKey.currentState == null) return;
    ScaffoldState state = _scaffoldKey.currentState!;
    state.isDrawerOpen == false ? state.openDrawer() : state.closeDrawer();
  }

  /// Function For On Pressed To Action Button
  void onPressedToActionButton() {
    _scaffoldKey.currentState?.closeDrawer();
    if (widget.onTapMore != null) widget.onTapMore!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: CustomAppBar(
        title: widget.appBarTitle ?? "",
        onTap: changeStateOfDrawer,
        actions: [
          IconButton(
            onPressed: onPressedToActionButton,
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: widget.drawer,
        body: widget.body,
        drawerEnableOpenDragGesture: false,
      ),
    );
  }
}
