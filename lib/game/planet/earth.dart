import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Earth extends PositionComponent with CollisionCallbacks {
  late Sprite earthSprite;
  late CircleHitbox circleHitbox;
  final double radius;
  Earth({
    required super.position,
    required super.size,
    required this.radius,
  }) : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    earthSprite = await Sprite.load('earth.png');
    circleHitbox = CircleHitbox(
      anchor: Anchor.center,
      radius: radius,
      position: position,
    );
    add(circleHitbox);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    remove(circleHitbox);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    Future.delayed(
      const Duration(seconds: 5),
      () => add(circleHitbox),
    );
  }

  @override
  void render(Canvas canvas) {
    earthSprite.render(canvas, size: size, position: position, anchor: anchor);
  }
}
