import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:space_game/game/space_game.dart';

import '../component/pause_icon.dart';

class Level2 extends Component with HasGameReference<SpaceGame> {
  late ParallaxComponent<FlameGame<World>> parallax;

  // late PauseIcon pauseIcon;

  @override
  Future<void> onMount() async {
    game.overlays.add('questions');
    parallax = await game.loadParallaxComponent(
      [
        ParallaxImageData('stars_0.png'),
        ParallaxImageData('stars_1.png'),
        ParallaxImageData('stars_2.png'),
      ],
      baseVelocity: Vector2(0, -3),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 3),
      angle: radians(90),
      anchor: Anchor.center,
      position: Vector2(game.size.x / 2, game.size.y / 2),
      size: Vector2.all(game.size.x),
    );
    add(parallax);
    // pauseIcon = PauseIcon(
    //   action: () {
    //     game.overlays.add('pause');
    //     game.pauseEngine();
    //   },
    // );
    // game.camera.viewport.add(pauseIcon);

    return super.onMount();
  }

  @override
  void onRemove() {
    parallax.removeFromParent();
    // pauseIcon.removeFromParent();
    super.onRemove();
  }
}
