import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainBuilder {
  static Widget builder(BuildContext context, Widget? child) {
    return Stack(
      children: [
        child ?? const SizedBox(),
        buildPauseButton(context),
      ],
    );
  }

  static Widget buildPauseButton(BuildContext context) {
    return Visibility(
      visible: context.watch<PlayerProvider>().player.playing,
      child: Positioned(
        right: 20,
        bottom: 150,
        child: FloatingActionButton(
          backgroundColor: context.theme.appBarTheme.titleTextStyle?.color,
          onPressed: context.watch<PlayerProvider>().stop,
          child: SvgPicture.asset(
            ImageConstants.stopActiveIcon,
            height: 40,
            width: 40,
            color: context.theme.backgroundColor,
          ),
        ),
      ),
    );
  }
}
