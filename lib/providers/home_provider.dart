import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// Focus node for search bar in home screen
  final FocusNode searchBarFocusNode = FocusNode();

  ///Un Focus for search bar in home screen
  void searchBarFocusNodeUnFocus() {
    searchBarFocusNode.unfocus();
  }
}
