import 'package:flutter/material.dart';

/// [SingleChildScrollView] body
/// default padding `EdgeInsets.symmetric(horizontal: 20.0)`.
class ScrollBody extends StatelessWidget {

  ScrollBody({
    Key? key,
    required this.body,
    this.controller,
    EdgeInsets? padding,
  })  : padding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        super(key: key);

  /// Scrollable body
  final Widget body;

  /// Content padding [EdgeInsets]
  /// Default .symectric(horizontal:20.0)
   EdgeInsets padding;

  /// Scroll controller
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;
        return SingleChildScrollView(
          controller: controller,
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height, minWidth: width),
            child: IntrinsicHeight(child: body),
          ),
        );
      },
    );
  }
}
