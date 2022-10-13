import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// Focus node for search field in the home screen
  final FocusNode searchBarFocusNode = FocusNode();

  /// Un-focus Search Field
  void searchBarFocusNodeUnFocus() {
    searchBarFocusNode.unfocus();
  }
}
