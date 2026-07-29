import 'dart:async';
import 'dart:math';
import 'package:hand_landmarker/hand_landmarker.dart';

enum GestureType { none, swipeUp, swipeDown, swipeLeft, swipeRight }

class GestureEvent {
  final GestureType type;
  GestureEvent(this.type);
}

class HandGestureService {
  static const int _maxHistory = 12;
  static const double _swipeThreshold = 0.05;
  static const int _cooldownFrames = 20;
  static const int _minFramesBeforeDetection = 6;

  final List<Point<double>> _positions = [];
  Point<double>? _currentPos;
  int _framesSinceHandDetected = 0;
  int _cooldown = 0;
  GestureType _lastGesture = GestureType.none;

  final _gestureCtrl = StreamController<GestureEvent>.broadcast();
  Stream<GestureEvent> get gestureStream => _gestureCtrl.stream;

  bool get isHandDetected => _framesSinceHandDetected > 0;
  Point<double>? get currentPosition => _currentPos;
  GestureType get lastGesture => _lastGesture;

  void processHands(List<Hand> hands) {
    if (_cooldown > 0) _cooldown--;

    if (hands.isEmpty) {
      _framesSinceHandDetected = 0;
      if (_positions.isNotEmpty) _positions.clear();
      return;
    }

    _framesSinceHandDetected++;

    final hand = hands.first;
    double cx = 0, cy = 0;
    for (final lm in hand.landmarks) {
      cx += lm.x;
      cy += lm.y;
    }
    cx /= hand.landmarks.length;
    cy /= hand.landmarks.length;

    _currentPos = Point(cx, cy);
    _positions.add(_currentPos!);
    if (_positions.length > _maxHistory) _positions.removeAt(0);

    if (_framesSinceHandDetected < _minFramesBeforeDetection || _cooldown > 0) return;
    if (_positions.length < 5) return;

    _detectGesture();
  }

  void _detectGesture() {
    final n = _positions.length;
    final mid = n ~/ 2;
    if (mid < 2) return;

    final firstHalf = _positions.sublist(0, mid);
    final secondHalf = _positions.sublist(mid);

    final avgOld = Point<double>(
      firstHalf.map((p) => p.x).reduce((a, b) => a + b) / firstHalf.length,
      firstHalf.map((p) => p.y).reduce((a, b) => a + b) / firstHalf.length,
    );
    final avgNew = Point<double>(
      secondHalf.map((p) => p.x).reduce((a, b) => a + b) / secondHalf.length,
      secondHalf.map((p) => p.y).reduce((a, b) => a + b) / secondHalf.length,
    );

    final dx = avgNew.x - avgOld.x;
    final dy = avgNew.y - avgOld.y;
    final dist = sqrt(dx * dx + dy * dy);

    if (dist < _swipeThreshold) return;

    final isVertical = dy.abs() > dx.abs();
    final dominance = isVertical
        ? dy.abs() / (dx.abs() + 0.001)
        : dx.abs() / (dy.abs() + 0.001);

    if (dominance < 1.5) return;

    GestureType gesture;
    if (isVertical) {
      gesture = dy < 0 ? GestureType.swipeUp : GestureType.swipeDown;
    } else {
      gesture = dx < 0 ? GestureType.swipeLeft : GestureType.swipeRight;
    }

    _lastGesture = gesture;
    _cooldown = _cooldownFrames;
    _positions.clear();
    _gestureCtrl.add(GestureEvent(gesture));
  }

  void dispose() {
    _gestureCtrl.close();
  }
}
