import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_game/game/space_game.dart';

import '../component/rounded_button.dart';

class Start extends Component with HasGameReference<SpaceGame> {
  late ParallaxComponent<FlameGame<World>> parallax;

  late final TextComponent _logo;
  late final RoundedButton _button1;
  late final RoundedButton _button2;

  Color backgroundColor() => const Color(0xff000000);

  @override
  Future<void> onLoad() async {
    parallax = await game.loadParallaxComponent(
      [
        ParallaxImageData('stars_0.png'),
        ParallaxImageData('stars_1.png'),
        ParallaxImageData('stars_2.png'),
      ],
      baseVelocity: Vector2(0, -4),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 4),
      angle: radians(90),
      anchor: Anchor.center,
      size: Vector2.all(game.size.x),
      position: Vector2(game.size.x / 2, game.size.y / 2)
    );
    add(parallax);
    addAll([
      _logo = TextComponent(
        position: Vector2(game.size.x / 2, (game.size.y / 2) - 100),
        text: 'Stellar',
        textRenderer: TextPaint(
          style: GoogleFonts.orbitron(
            fontSize: 64,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        anchor: Anchor.center,
      ),
      _button1 = RoundedButton(
        text: 'Level 1',
        action: () => game.router.pushNamed('level1'),
        color: Colors.transparent,
        borderColor: Colors.blue,
        anchor: Anchor.center,
        position: Vector2(game.size.x / 2, game.size.y / 2),
      ),
      _button2 = RoundedButton(
        text: 'Level 2',
        action: () => game.router.pushNamed('level2'),
        color: Colors.transparent,
        borderColor: Colors.blue,
        anchor: Anchor.center,
        position: Vector2(game.size.x / 2, (game.size.y / 2) + 60),
      ),
    ]);
    return super.onLoad();
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   parallax.position = game.camera.viewfinder.position;
  // }
}
