import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/enums.dart';
import '../../constants/images.dart';
import '../../models/position_data.dart';
import '../../providers/player_provider.dart';
import '../popup_menus/play_bar_more_popup_menu.dart';

class PlayBar extends StatelessWidget {
  const PlayBar({Key? key, this.padding}) : super(key: key);

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.watch<PlayerProvider>().playerState != EPlayerState.stop,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0.0, 45.024),
              blurRadius: 72.36,
            ),
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 64, sigmaY: 64),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StreamBuilder<PositionData>(
                  stream: context.read<PlayerProvider>().positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return ProgressBar(
                      progress: positionData?.position ?? Duration.zero,
                      buffered: positionData?.bufferPosition ?? Duration.zero,
                      total: positionData?.duration ?? Duration.zero,
                      barHeight: 4,
                      thumbRadius: 2,
                      thumbGlowRadius: 0,
                      baseBarColor: AppColors.black11,
                      progressBarColor: AppColors.brandy,
                      bufferedBarColor: AppColors.black11,
                      barCapShape: BarCapShape.square,
                      thumbColor: AppColors.brandy,
                      thumbGlowColor: Colors.transparent,
                      timeLabelLocation: TimeLabelLocation.none,
                      onSeek: context.read<PlayerProvider>().player.seek,
                    );
                  },
                ),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.47),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayBarMorePopupMenu(
                        onTapDownload: () {},
                      ),
                      IconButton(
                        onPressed: context.read<PlayerProvider>().previous,
                        icon: SvgPicture.asset(
                          ImageConstants.previousIcon,
                          color: context.watch<PlayerProvider>().isPrevious ? null : AppColors.grey11,
                        ),
                      ),
                      buildPlayAndPauseIcon(context),
                      IconButton(
                        onPressed: context.read<PlayerProvider>().next,
                        icon: SvgPicture.asset(
                          ImageConstants.nextIcon,
                          color: context.watch<PlayerProvider>().isNext ? null : AppColors.grey11,
                        ),
                      ),
                      IconButton(
                        onPressed: context.watch<PlayerProvider>().stop,
                        icon: SvgPicture.asset(ImageConstants.borderExitIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildPlayAndPauseIcon(BuildContext context) {
    bool isPause = context.watch<PlayerProvider>().playerState == EPlayerState.pause;
    return IconButton(
      onPressed: () {
        isPause ? context.read<PlayerProvider>().resume() : context.read<PlayerProvider>().pause();
      },
      icon: SvgPicture.asset(isPause ? ImageConstants.play : ImageConstants.pauseIcon),
    );
  }
}
