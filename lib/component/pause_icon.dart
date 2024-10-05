import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class PauseIcon extends PositionComponent
    with TapCallbacks {
  final void Function() action;

  PauseIcon({
    required this.action,
  }) {
    size = Vector2.all(40);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF);
    const width = 7.0;
    const height = 25.0;
    const spacing = 5.0;

    canvas.drawRect(const Rect.fromLTWH(0, 0, width, height), paint);

    canvas.drawRect(
        const Rect.fromLTWH(width + spacing, 0, width, height), paint);
  }

  @override
  void onTapUp(TapUpEvent event) {
    action();
  }
}
