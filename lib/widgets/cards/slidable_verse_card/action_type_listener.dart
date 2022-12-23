import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../database/local_db.dart';

class ActionTypeListener extends StatefulWidget {
  const ActionTypeListener({
    Key? key,
    required this.child,
    required this.isFirstVerse,
  }) : super(key: key);

  final Widget child;
  final bool isFirstVerse;

  @override
  _ActionTypeListenerState createState() => _ActionTypeListenerState();
}

class _ActionTypeListenerState extends State<ActionTypeListener> {
  ValueNotifier<ActionPaneType>? _actionPaneTypeValueNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (widget.isFirstVerse) {
        if (!LocalDb.getShowCase) {
          LocalDb.setShowCase(true);
          Future.delayed(const Duration(milliseconds: 700)).whenComplete(() =>
              Slidable.of(context)!.openEndActionPane(
                  duration: const Duration(milliseconds: 1000)));
          Future.delayed(const Duration(milliseconds: 3000)).whenComplete(() =>
              Slidable.of(context)!
                  .close(duration: const Duration(milliseconds: 1000)));
        }
      }
    });
    _actionPaneTypeValueNotifier = Slidable.of(context)?.actionPaneType;
    _actionPaneTypeValueNotifier?.addListener(_onActionPaneTypeChanged);
  }

  @override
  void dispose() {
    _actionPaneTypeValueNotifier?.removeListener(_onActionPaneTypeChanged);
    super.dispose();
  }

  void _onActionPaneTypeChanged() {
    debugPrint('Value is ${_actionPaneTypeValueNotifier?.value}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.child,
      onTap: () {
        if (_actionPaneTypeValueNotifier?.value == ActionPaneType.end) {
          Slidable.of(context)!.close();
        }
      },
      onLongPress: () {
        if (_actionPaneTypeValueNotifier?.value == ActionPaneType.none) {
          Slidable.of(context)!.openEndActionPane();
        }
      },
    );
  }
}
