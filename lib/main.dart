import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_game/menu/pause_menu.dart';
import 'package:space_game/menu/questions_menu.dart';
import 'package:space_game/menu/score_menu.dart';

import 'menu/information_menu.dart';
import 'game/space_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(
    GameWidget<SpaceGame>.controlled(
      gameFactory: SpaceGame.new,
      overlayBuilderMap: {
        'information': (_, game) => InformationMenu(
              spaceGame: game,
              planet: game.planet,
            ),
        'pause': (_, game) => PauseMenu(spaceGame: game),
        'questions': (_, game) => QuestionsMenu(spaceGame: game),
        'score': (_, game) => ScoreMenu(spaceGame: game),
      },
    ),
  );
}
