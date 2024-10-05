import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/custom_button.dart';
import '../game/space_game.dart';

class ScoreMenu extends StatelessWidget {
  final SpaceGame spaceGame;

  const ScoreMenu({super.key, required this.spaceGame});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(0, 171, 71, 71),
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
          child: Container(
            height: spaceGame.size.y - 100,
            width: spaceGame.size.x / 2,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Score',
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your Score: ${spaceGame.score} / 10',
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                RoundedButton(
                  text: 'Back to Menu',
                  color: Colors.transparent,
                  borderColor: Colors.blue,
                  action: () {
                    spaceGame.score = 0;
                    spaceGame.overlays.remove('score');
                    spaceGame.router.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
