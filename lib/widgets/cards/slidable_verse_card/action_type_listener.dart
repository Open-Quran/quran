import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/widgets/cards/slidable_verse_card/slidable_provider.dart';

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
  ActionTypeListenerState createState() => ActionTypeListenerState();
}

class ActionTypeListenerState extends State<ActionTypeListener> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.child,
      onTap: () {
        if (context
                .read<SlidableProvider>()
                .actionPaneTypeValueNotifier
                ?.value ==
            ActionPaneType.end) {
          Slidable.of(context)!.close();
        }
      },
      onLongPress: () {
        if (context
                .read<SlidableProvider>()
                .actionPaneTypeValueNotifier
                ?.value ==
            ActionPaneType.none) {
          Slidable.of(context)!.openEndActionPane();
        }
      },
    );
  }
}
