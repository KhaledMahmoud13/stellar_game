import 'package:flame/game.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../model/planet.dart';
import 'start.dart';
import 'level1.dart';
import 'level2.dart';

class SpaceGame extends FlameGame with HasCollisionDetection {
  late final RouterComponent router;
  late FlutterTts flutterTts;

  String planetName = '';

  late Planet planet;
  late int score;

  @override
  Future<void> onLoad() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    add(router = RouterComponent(initialRoute: 'home', routes: {
      'home': Route(Start.new),
      'level1': Route(Level1.new),
      'level2': Route(Level2.new),
    }));

    return super.onLoad();
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }

  Future<void> pauseSpeaking() async {
    await flutterTts.pause();
  }

  Future<void> stopSpeaking() async {
    await flutterTts.stop();
  }
}
