import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../providers/player_provider.dart';

class MyAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final BuildContext _context;

  MyAudioHandler(this._context);

  /// Getting player provider
  PlayerProvider get playerProvider => _context.read<PlayerProvider>();

  /// Play The background
  @override
  Future<void> play() async {
    if (playerProvider.isPlayedFromBackground) playerProvider.resume(isRunBackGround: false);
    playbackState.add(newPlaybackState);
    mediaItem.add(newMediaItem);
  }

  /// Pause The background
  @override
  Future<void> pause() async {
    if (playerProvider.isPlayedFromBackground) playerProvider.pause(isRunBackGround: false);
    playbackState.add(newPlaybackState);
    mediaItem.add(newMediaItem);
  }

  /// Stop The background
  @override
  Future<void> stop() async {
    if (playerProvider.isPlayedFromBackground) playerProvider.stop(isRunBackGround: false);
    playbackState.add(PlaybackState());
    mediaItem.add(null);
  }

  @override
  Future<void> onTaskRemoved() async {
    exit(0);
  }

  /// Getting Background media item
  MediaItem get newMediaItem {
    return MediaItem(
      id: '1',
      title: playerProvider.verseListToPlay.first.text ?? "",
    );
  }

  /// Getting Background playback state
  PlaybackState get newPlaybackState {
    return PlaybackState(
      controls: [
        playerProvider.player.playing ? MediaControl.pause : MediaControl.play,
        MediaControl.stop,
      ],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[playerProvider.player.processingState]!,
      playing: playerProvider.player.playing,
    );
  }
}
