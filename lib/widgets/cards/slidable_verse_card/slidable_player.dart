import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidablePlayer extends StatefulWidget {
  const SlidablePlayer({
    Key? key,
    this.animation,
    required this.child,
  }) : super(key: key);

  final Animation<double>? animation;
  final Widget child;

  @override
  SlidablePlayerState createState() => SlidablePlayerState();

  static SlidablePlayerState? of(BuildContext context) {
    return context.findAncestorStateOfType<SlidablePlayerState>();
  }
}

class SlidablePlayerState extends State<SlidablePlayer> {
  SlidableController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.animation != null) {
      widget.animation!.addListener(handleAnimationChanged);
    }
  }

  @override
  void dispose() {
    if (widget.animation != null) {
      widget.animation!.removeListener(handleAnimationChanged);
    }
    super.dispose();
  }

  void handleAnimationChanged() {
    final value = widget.animation!.value;
    controller!.ratio = value;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
