import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/custom_button.dart';
import '../game/space_game.dart';

class PauseMenu extends StatelessWidget {
  final SpaceGame spaceGame;

  const PauseMenu({super.key, required this.spaceGame});

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
                Text(
                  'Paused',
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                RoundedButton(
                  text: 'Resume',
                  color: Colors.transparent,
                  borderColor: Colors.blue,
                  action: () {
                    spaceGame.overlays.remove('pause');
                    spaceGame.resumeEngine();
                  },
                ),
                const SizedBox(height: 20),
                RoundedButton(
                  text: 'Back to Menu',
                  color: Colors.transparent,
                  borderColor: Colors.blue,
                  action: () {
                    spaceGame.overlays.remove('pause');
                    spaceGame.resumeEngine();
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
