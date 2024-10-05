import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_game/model/planet.dart';

import '../game/space_game.dart';

class InformationMenu extends StatefulWidget {
  final SpaceGame spaceGame;
  final Planet planet;

  const InformationMenu({
    super.key,
    required this.spaceGame,
    required this.planet,
  });

  @override
  State<InformationMenu> createState() => _InformationMenuState();
}

class _InformationMenuState extends State<InformationMenu> {
  bool speaking = false;

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
            height: widget.spaceGame.size.y - 8,
            width: widget.spaceGame.size.x / 1.5,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: speaking ? _pause : _resume,
                      icon: Icon(
                        speaking ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await widget.spaceGame.stopSpeaking();
                        widget.spaceGame.overlays.remove('information');
                        widget.spaceGame.resumeEngine();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.planet.name,
                  style:
                      GoogleFonts.orbitron(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          widget.planet.description,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        if (widget.planet.astronautQuote != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              widget.planet.astronautQuote!,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            widget.planet.explanation,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        if (widget.planet.robotInteraction != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              widget.planet.robotInteraction!,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        if (widget.planet.robotExplanation != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              widget.planet.robotExplanation!,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        if (widget.planet.moonDescription != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              widget.planet.moonDescription!,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pause() async {
    await widget.spaceGame.pauseSpeaking();
    setState(() {
      speaking = false;
    });
  }

  Future<void> _resume() async {
    String text = '';
    // await widget.spaceGame.speak(widget.planet.name);
    text += '${widget.planet.name}\n';
    // await widget.spaceGame.speak(widget.planet.description);
    text += '${widget.planet.description}\n';
    if (widget.planet.astronautQuote != null) {
      // await widget.spaceGame.speak(widget.planet.astronautQuote!);
      text += '${widget.planet.astronautQuote}\n';
    }
    // await widget.spaceGame.speak(widget.planet.explanation);
    text += '${widget.planet.explanation}\n';
    if (widget.planet.robotInteraction != null) {
      // await widget.spaceGame.speak(widget.planet.robotInteraction!);
      text += '${widget.planet.robotInteraction}\n';
    }
    if (widget.planet.robotExplanation != null) {
      // await widget.spaceGame.speak(widget.planet.robotExplanation!);
      text += '${widget.planet.robotExplanation}\n';
    }
    if (widget.planet.moonDescription != null) {
      // await widget.spaceGame.speak(widget.planet.moonDescription!);
      text += '${widget.planet.moonDescription}\n';
    }
    await widget.spaceGame.speak(text);
    setState(() {
      speaking = true;
    });
    widget.spaceGame.flutterTts.setCompletionHandler(
      () => setState(() {
        speaking = false;
      }),
    );
  }
}
