import 'package:audio_service/audio_service.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/handlers/audio_player_handler.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerProvider extends ChangeNotifier {
  /// Audio Player
  final player = AudioPlayer();

  /// Background audio handler
  late AudioHandler _audioHandler;

  /// BuildContext
  late BuildContext _context;

  /// Verses to play
  List<VerseModel> verseListToPlay = [];

  /// Are there any processes in the background?
  bool isPlayedFromBackground = true;

  PlayerProvider() {
    player.playerStateStream.listen(checkIfCompleted);
  }

  /// Creating Audio Handler
  createAudioHandler(BuildContext context) async {
    _context = context;
    _audioHandler = await AudioService.init(
      builder: () => MyAudioHandler(_context),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.fabrikod.fabrikod_quran',
        androidNotificationChannelName: 'Fabrikod Quran',
      ),
    );
  }

  /// player is complete
  void checkIfCompleted(event) {
    if (event.processingState == ProcessingState.completed) {
      if (verseListToPlay.isEmpty) return;
      verseListToPlay.removeAt(0);
      verseListToPlay.isEmpty ? stop() : play();
    }
  }

  /// Is the chosen verse playing?
  bool isPlayingVerse(String verseKey) {
    if (!player.playing || verseListToPlay.isEmpty) return false;
    return verseKey == verseListToPlay.first.verseKey;
  }

  /// Is the chosen mushaf page playing?
  bool isPlayingMushaf({int? pageNumber, int? surahId}) {
    if (!player.playing || verseListToPlay.isEmpty) return false;
    return verseListToPlay.first.surahId == surahId &&
        verseListToPlay.first.pageNumber == pageNumber;
  }

  /// On Tap to Play and pause button
  void onTapPlayOrPause(bool isPlaying, List<VerseModel> verses) {
    verseListToPlay = verses;
    isPlaying ? stop() : play();
  }

  /// Play verse
  Future<void> play() async {
    if (verseListToPlay.isEmpty) return;
    await player.setUrl(RestfulConstants.getAudioUrlOfVerse(verseListToPlay.first.audioUrl!));
    player.play();
    playOnBackground();
    notifyListeners();
  }

  /// Pause verse
  void pause({bool isRunBackGround = true}) {
    player.pause();
    if (isRunBackGround) pauseOnBackground();
    notifyListeners();
  }

  /// Resume verse
  void resume({bool isRunBackGround = true}) {
    player.play();
    if (isRunBackGround) playOnBackground();
    notifyListeners();
  }

  /// Stop verse
  void stop({bool isRunBackGround = true}) {
    verseListToPlay.clear();
    player.stop();
    if (isRunBackGround) stopOnBackground();
    notifyListeners();
  }

  /// Play Background
  Future<void> playOnBackground() async {
    isPlayedFromBackground = false;
    await _audioHandler.play();
    isPlayedFromBackground = true;
  }

  /// Pause Background
  Future<void> pauseOnBackground() async {
    isPlayedFromBackground = false;
    await _audioHandler.pause();
    isPlayedFromBackground = true;
  }

  /// Stop Background
  Future<void> stopOnBackground() async {
    isPlayedFromBackground = false;
    await _audioHandler.stop();
    isPlayedFromBackground = true;
  }
}
