import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_game/model/planet.dart';

import '../game/planet/earth.dart';
import '../game/planet/jupiter.dart';
import '../game/planet/mars.dart';
import '../game/planet/mercury.dart';
import '../game/planet/neptune.dart';
import '../game/planet/saturn.dart';
import '../game/planet/sun.dart';
import '../game/planet/uranus.dart';
import '../game/planet/venus.dart';
import '../game/space_game.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<SpaceGame>, CollisionCallbacks {
  final JoystickComponent joystick;
  final Vector2 sunPosition;
  final Vector2 mercuryPosition;
  final Vector2 venusPosition;
  final Vector2 earthPosition;
  final Vector2 marsPosition;
  final Vector2 jupiterPosition;
  final Vector2 saturnPosition;
  final Vector2 uranusPosition;
  final Vector2 neptunePosition;

  Player({
    required super.position,
    required this.joystick,
    required this.sunPosition,
    required this.mercuryPosition,
    required this.venusPosition,
    required this.earthPosition,
    required this.marsPosition,
    required this.jupiterPosition,
    required this.saturnPosition,
    required this.uranusPosition,
    required this.neptunePosition,
  }) : super(anchor: Anchor.center, size: Vector2(60, 85), angle: radians(90));

  double _velocity = 300;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    animation = await game.loadSpriteAnimation(
      'player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2(32, 48),
      ),
    );

    add(RectangleHitbox(
      size: size,
      position: Vector2(30, 40),
      anchor: anchor,
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (joystick.direction != JoystickDirection.idle) {
      position.add(joystick.relativeDelta * _velocity * dt);
      angle = joystick.delta.screenAngle();
    }

    updateShipSpeed(
      currentPosition: position,
      sunPosition: sunPosition,
      mercuryPosition: mercuryPosition,
      venusPosition: venusPosition,
      earthPosition: earthPosition,
      marsPosition: marsPosition,
      jupiterPosition: jupiterPosition,
      saturnPosition: saturnPosition,
      uranusPosition: uranusPosition,
      neptunePosition: neptunePosition,
    );

    if (position.y < -300) {
      position.y = -300;
    }
    if (position.y > 300) {
      position.y = 300;
    }

    if (position.x < 0) {
      position.x = 0;
    }

    if (position.x > 6000) {
      position.x = 6000;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // if (other is Sun) {
    //   print('Sun');
    //   game.planetName = 'Sun';
    //   game.overlays.add('information');
    //   game.pauseEngine();
    // } else
      if (other is Mercury) {
      print('Mercury');
      game.planetName = 'Mercury';
      game.planet = Planet.getPlanetByName('Mercury')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Venus) {
      print('Venus');
      game.planetName = 'Venus';
      game.planet = Planet.getPlanetByName('Venus')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Earth) {
      print('Earth');
      game.planetName = 'Earth';
      game.planet = Planet.getPlanetByName('Earth')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Mars) {
      print('Mars');
      game.planetName = 'Mars';
      game.planet = Planet.getPlanetByName('Mars')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Jupiter) {
      print('Jupiter');
      game.planetName = 'Jupiter';
      game.planet = Planet.getPlanetByName('Jupiter')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Saturn) {
      print('Saturn');
      game.planetName = 'Saturn';
      game.planet = Planet.getPlanetByName('Saturn')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Uranus) {
      print('Uranus');
      game.planetName = 'Uranus';
      game.planet = Planet.getPlanetByName('Uranus')!;
      game.overlays.add('information');
      game.pauseEngine();
    } else if (other is Neptune) {
      print('Neptune');
      game.planetName = 'Neptune';
      game.planet = Planet.getPlanetByName('Neptune')!;
      game.overlays.add('information');
      game.pauseEngine();
    }
  }

  void updateShipSpeed({
    required Vector2 currentPosition,
    required Vector2 mercuryPosition,
    required Vector2 venusPosition,
    required Vector2 earthPosition,
    required Vector2 marsPosition,
    required Vector2 jupiterPosition,
    required Vector2 saturnPosition,
    required Vector2 uranusPosition,
    required Vector2 neptunePosition,
    required Vector2 sunPosition,
  }) {
    double distanceFromSun = currentPosition.distanceTo(sunPosition);
    double distanceFromMercury = currentPosition.distanceTo(mercuryPosition);
    double distanceFromVenus = currentPosition.distanceTo(venusPosition);
    double distanceFromEarth = currentPosition.distanceTo(earthPosition);
    double distanceFromMars = currentPosition.distanceTo(marsPosition);
    double distanceFromJupiter = currentPosition.distanceTo(jupiterPosition);
    double distanceFromSaturn = currentPosition.distanceTo(saturnPosition);
    double distanceFromUranus = currentPosition.distanceTo(uranusPosition);
    double distanceFromNeptune = currentPosition.distanceTo(neptunePosition);

    if (distanceFromSun > 500) {
      _velocity = 350;
    } else if (distanceFromSun <= 500 && distanceFromSun > 100) {
      _velocity = 550;
    } else if (distanceFromSun <= 100) {
      _velocity = 250;
    }

    if (distanceFromMercury < 200) {
      _velocity = 150;
    } else if (distanceFromVenus < 200) {
      _velocity = 130;
    } else if (distanceFromEarth < 200) {
      _velocity = 110;
    } else if (distanceFromMars < 200) {
      _velocity = 100;
    } else if (distanceFromJupiter < 200) {
      _velocity = 90;
    } else if (distanceFromSaturn < 200) {
      _velocity = 80;
    } else if (distanceFromUranus < 200) {
      _velocity = 70;
    } else if (distanceFromNeptune < 200) {
      _velocity = 60;
    }
  }
}
