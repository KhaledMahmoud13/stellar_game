import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Uranus extends PositionComponent with CollisionCallbacks {
  late Sprite uranusSprite;
  late CircleHitbox circleHitbox;
  final double radius;
  Uranus({
    required super.position,
    required super.size,
    required this.radius,
  }) : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    uranusSprite = await Sprite.load('uranus.png');
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
    uranusSprite.render(canvas, size: size, position: position, anchor: anchor);
  }
}
