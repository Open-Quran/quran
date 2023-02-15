import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableProvider extends ChangeNotifier {
  /// Class Constructor
  SlidableProvider(this._context){
    actionPaneTypeValueNotifier = Slidable.of(_context)?.actionPaneType;
    actionPaneTypeValueNotifier?.addListener(_onActionPaneTypeChanged);
  }

  /// Slidable context
  final BuildContext _context;

  void _onActionPaneTypeChanged() {
    debugPrint('Value is ${actionPaneTypeValueNotifier?.value}');
  }

  @override
  void dispose() {
    actionPaneTypeValueNotifier?.removeListener(_onActionPaneTypeChanged);
    super.dispose();
  }

  ValueNotifier<ActionPaneType>? actionPaneTypeValueNotifier;

}