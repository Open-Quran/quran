import 'package:audio_service/audio_service.dart';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../constants/enums.dart';
import '../constants/restful.dart';
import '../handlers/audio_player_handler.dart';
import '../models/position_data.dart';
import '../models/verse_model.dart';

class PlayerProvider extends ChangeNotifier {
  /// Audio Player
  final player = AudioPlayer();

  /// Background audio handler
  late AudioHandler _audioHandler;

  /// BuildContext
  late BuildContext _context;

  /// Verses to play
  List<VerseModel> verseListToPlay = [];

  /// Index of the playing verse
  int playerIndex = 0;

  /// Player Speed title
  String playerSpeedTitle = "Normal";

  /// Reciter Title
  String reciterTitle = "Mohmoud Al Husary";

  /// EPlayerState [EPlayerState]
  EPlayerState playerState = EPlayerState.stop;

  /// Are there any processes in the background?
  bool isPlayedFromBackground = true;

  PlayerProvider() {
    player.playerStateStream.listen(checkIfCompleted);
  }

  /// Listens the Player's Position
  Stream<PositionData> get positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferPosition, duration) => PositionData(
          position: position,
          bufferPosition: bufferPosition,
          duration: duration,
        ),
      );

  /// Creating Audio Handler
  createAudioHandler(BuildContext context) async {
    _context = context;
    _audioHandler = await AudioService.init(
      builder: () => MyAudioHandler(_context),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.open.quran',
        androidNotificationChannelName: 'Fabrikod Quran',
      ),
    );
  }

  /// Checking player for the next ayat audio
  /// if there is no ayat stop player if there are ayats play
  void checkIfCompleted(event) {
    if (event.processingState == ProcessingState.completed) {
      if (verseListToPlay.isEmpty) return;
      if (playerIndex == verseListToPlay.length - 1) {
        stop();
      } else {
        playerIndex++;
        play();
      }
    }
  }

  /// Change Player's Playing Speed
  Future<void> setPlaybackRate(String value) async {
    playerSpeedTitle = value;
    if (value == "Normal") value = "1.0";
    await player.setSpeed(double.tryParse(value) ?? 1.0);
    notifyListeners();
  }

  /// Change Reciter
  Future<void> setReciter(String value) async {
    reciterTitle = value;
    if (value == "Mohmoud Al Husary") value = "Mohmoud Al Husary";
    notifyListeners();
  }

  /// Checking if previous ayat exists
  bool get isPrevious => playerIndex > 0;

  /// Play previous Ayat
  void previous() {
    if (!isPrevious) return;
    playerIndex--;
    play();
  }

  /// Checking if next ayat exists
  bool get isNext => playerIndex < verseListToPlay.length - 1;

  /// Play Next Player
  void next() {
    if (!isNext) return;
    playerIndex++;
    play();
  }

  /// Is selected verse playing?
  bool isPlayingVerse(String verseKey) {
    if (playerState == EPlayerState.stop || verseListToPlay.isEmpty) return false;
    return verseKey == verseListToPlay[playerIndex].verseKey;
  }

  /// Is the chosen mushaf page playing?
  bool isPlayingMushaf({int? pageNumber, int? surahId}) {
    if (!player.playing || verseListToPlay.isEmpty) return false;
    return verseListToPlay.first.surahId == surahId && verseListToPlay.first.pageNumber == pageNumber;
  }

  /// OnTap to play or pause
  void onTapPlayOrPause(int index, bool isPlaying, List<VerseModel> verses) {
    verseListToPlay = verses;
    playerIndex = index;
    isPlaying ? pause() : play();
  }

  /// Play verse
  Future<void> play() async {
    final audioUrl = verseListToPlay[playerIndex].audioUrl;
    if (verseListToPlay.isEmpty || audioUrl == null) return;
    await player.setUrl(RestfulConstants.getAudioUrlOfVerse(audioUrl));
    player.play();
    playerState = EPlayerState.playing;
    playOnBackground();
    notifyListeners();
  }

  /// Pause verse
  void pause({bool isRunBackGround = true}) {
    player.pause();
    playerState = EPlayerState.pause;
    if (isRunBackGround) pauseOnBackground();
    notifyListeners();
  }

  /// Resume verse
  void resume({bool isRunBackGround = true}) {
    player.play();
    playerState = EPlayerState.playing;
    if (isRunBackGround) playOnBackground();
    notifyListeners();
  }

  /// Stop verse
  void stop({bool isRunBackGround = true}) {
    verseListToPlay = [];
    player.stop();
    playerState = EPlayerState.stop;
    if (isRunBackGround) stopOnBackground();
    notifyListeners();
  }

  /// Play when app in background
  Future<void> playOnBackground() async {
    isPlayedFromBackground = false;
    await _audioHandler.play();
    isPlayedFromBackground = true;
  }

  /// Pause app in background
  Future<void> pauseOnBackground() async {
    isPlayedFromBackground = false;
    await _audioHandler.pause();
    isPlayedFromBackground = true;
  }

  /// Stop app in background
  Future<void> stopOnBackground() async {
    isPlayedFromBackground = false;
    await _audioHandler.stop();
    isPlayedFromBackground = true;
  }
}
