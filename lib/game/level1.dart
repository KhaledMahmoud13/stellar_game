import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:space_game/game/space_game.dart';

import 'planet/earth.dart';
import 'planet/jupiter.dart';
import 'planet/mars.dart';
import 'planet/mercury.dart';
import 'planet/neptune.dart';
import '../component/pause_icon.dart';
import 'planet/saturn.dart';
import 'planet/sun.dart';
import 'planet/uranus.dart';
import 'planet/venus.dart';
import '../component/player.dart';

class Level1 extends Component with HasGameReference<SpaceGame> {
  late ParallaxComponent<FlameGame<World>> parallax;
  late Player player;
  late Vector2 sunPosition;
  late Vector2 mercuryPosition;
  late Vector2 venusPosition;
  late Vector2 earthPosition;
  late Vector2 marsPosition;
  late Vector2 jupiterPosition;
  late Vector2 saturnPosition;
  late Vector2 uranusPosition;
  late Vector2 neptunePosition;
  late Sun sun;
  late Mercury mercury;
  late Venus venus;
  late Earth earth;
  late Mars mars;
  late Jupiter jupiter;
  late Saturn saturn;
  late Uranus uranus;
  late Neptune neptune;
  late PauseIcon pauseIcon;

  @override
  Future<void> onMount() async {
    parallax = await game.loadParallaxComponent(
      [
        ParallaxImageData('stars_0.png'),
        ParallaxImageData('stars_1.png'),
        ParallaxImageData('stars_2.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
      angle: radians(90),
      anchor: Anchor.center,
      position: Vector2(game.size.x / 2, game.size.y / 2),
      size: Vector2.all(game.size.x),
    );
    add(parallax);
    final image = await game.images.load('joystick.png');
    final sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 6,
      rows: 1,
    );
    final joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: sheet.getSpriteById(1),
        size: Vector2.all(75),
      ),
      background: SpriteComponent(
        sprite: sheet.getSpriteById(0),
        size: Vector2.all(100),
      ),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    final sunSize = Vector2.all(200);
    final mercurySize = Vector2.all(60);
    final venusSize = Vector2.all(100);
    final earthSize = Vector2.all(100);
    final marsSize = Vector2.all(80);
    final jupiterSize = Vector2.all(140);
    final saturnSize = Vector2.all(130);
    final uranusSize = Vector2.all(90);
    final neptuneSize = Vector2.all(90);
    sunPosition = Vector2(game.size.x / 2, 50);
    mercuryPosition = Vector2(sunPosition.x + 200, 20);
    venusPosition = Vector2(sunPosition.x + 400, 25);
    earthPosition = Vector2(sunPosition.x + 550, 25);
    marsPosition = Vector2(sunPosition.x + 700, 20);
    jupiterPosition = Vector2(sunPosition.x + 1000, 35);
    saturnPosition = Vector2(sunPosition.x + 1300, 35);
    uranusPosition = Vector2(sunPosition.x + 1800, 25);
    neptunePosition = Vector2(sunPosition.x + 2200, 25);
    sun = Sun(
      position: sunPosition,
      size: sunSize,
      radius: sunSize.x / 2,
    );
    mercury = Mercury(
      position: mercuryPosition,
      size: mercurySize,
      radius: mercurySize.x / 2,
    );
    venus = Venus(
      position: venusPosition,
      size: venusSize,
      radius: venusSize.x / 2,
    );
    earth = Earth(
      position: earthPosition,
      size: earthSize,
      radius: earthSize.x / 2,
    );
    mars = Mars(
      position: marsPosition,
      size: marsSize,
      radius: marsSize.x / 2,
    );
    jupiter = Jupiter(
      position: jupiterPosition,
      size: jupiterSize,
      radius: jupiterSize.x / 2,
    );
    saturn = Saturn(
      position: saturnPosition,
      size: saturnSize,
      radius: saturnSize.x / 2,
    );
    uranus = Uranus(
      position: uranusPosition,
      size: uranusSize,
      radius: uranusSize.x / 2,
    );
    neptune = Neptune(
      position: neptunePosition,
      size: neptuneSize,
      radius: neptuneSize.x / 2,
    );
    game.world.add(sun);
    game.world.add(mercury);
    game.world.add(venus);
    game.world.add(earth);
    game.world.add(mars);
    game.world.add(jupiter);
    game.world.add(saturn);
    game.world.add(uranus);
    game.world.add(neptune);
    game.world.add(
      player = Player(
        position: Vector2(50 / 2, 10),
        joystick: joystick,
        sunPosition: sunPosition,
        mercuryPosition: mercuryPosition,
        venusPosition: venusPosition,
        earthPosition: earthPosition,
        marsPosition: marsPosition,
        jupiterPosition: jupiterPosition,
        saturnPosition: saturnPosition,
        uranusPosition: uranusPosition,
        neptunePosition: neptunePosition,
      ),
    );
    game.camera.viewport.add(joystick);
    game.camera.follow(player);
    pauseIcon = PauseIcon(
      action: () {
        game.overlays.add('pause');
        game.pauseEngine();
      },
    );
    game.camera.viewport.add(pauseIcon);
    return super.onMount();
  }

  @override
  void onRemove() {
    parallax.removeFromParent();
    player.removeFromParent();
    player.joystick.removeFromParent();
    sun.removeFromParent();
    mercury.removeFromParent();
    venus.removeFromParent();
    earth.removeFromParent();
    mars.removeFromParent();
    jupiter.removeFromParent();
    saturn.removeFromParent();
    uranus.removeFromParent();
    neptune.removeFromParent();
    pauseIcon.removeFromParent();
    super.onRemove();
  }
}
