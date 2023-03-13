import 'package:flutter/material.dart';

class MainBuilder {
  static Widget builder(BuildContext context, Widget? child) {
    return child ?? const SizedBox();
  }
}
