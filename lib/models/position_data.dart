class PositionData {
  const PositionData({
    required this.position,
    required this.bufferPosition,
    this.duration,
  });
  final Duration position;
  final Duration bufferPosition;
  final Duration? duration;
}