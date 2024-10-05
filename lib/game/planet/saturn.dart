import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Saturn extends PositionComponent with CollisionCallbacks {
  late Sprite saturnSprite;
  late CircleHitbox circleHitbox;
  final double radius;
  Saturn({
    required super.position,
    required super.size,
    required this.radius,
  }) : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    saturnSprite = await Sprite.load('saturn.png');
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
    saturnSprite.render(canvas, size: size, position: position, anchor: anchor);
  }
}
