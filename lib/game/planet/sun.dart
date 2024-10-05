import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Sun extends PositionComponent with CollisionCallbacks {
  late Sprite sunSprite;
  late CircleHitbox circleHitbox;

  final double radius;

  Sun({
    required super.position,
    required super.size,
    required this.radius,
  }) : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sunSprite = await Sprite.load('sun.png');
    // circleHitbox = CircleHitbox(
    //   anchor: Anchor.center,
    //   radius: radius,
    //   position: position,
    // );
    // add(circleHitbox);
  }

  // @override
  // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  //   super.onCollision(intersectionPoints, other);
  //   remove(circleHitbox);
  // }

  // @override
  // void onCollisionEnd(PositionComponent other) {
  //   super.onCollisionEnd(other);
  //   Future.delayed(
  //     const Duration(seconds: 5),
  //     () => add(circleHitbox),
  //   );
  // }

  @override
  void render(Canvas canvas) {
    sunSprite.render(canvas, size: size, position: position, anchor: anchor);
  }
}
