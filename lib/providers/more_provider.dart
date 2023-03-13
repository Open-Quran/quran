import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class MoreProvider extends ChangeNotifier {
  /// More Provider Context
  final BuildContext _context;

  /// Class Constructor
  MoreProvider(this._context);

  Future<void> onPressRate() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      inAppReview.openStoreListing(
          appStoreId: '1642335045', microsoftStoreId: '...');
    }
  }
}
