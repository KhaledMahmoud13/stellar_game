import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_game/model/question.dart';

import '../game/space_game.dart';

class QuestionsMenu extends StatefulWidget {
  final SpaceGame spaceGame;

  const QuestionsMenu({super.key, required this.spaceGame});

  @override
  State<QuestionsMenu> createState() => _QuestionsMenuState();
}

class _QuestionsMenuState extends State<QuestionsMenu> {
  late List<Question> currentQuestions;
  late PageController pageController;
  late int score;
  late bool choose;

  @override
  void initState() {
    super.initState();
    currentQuestions = getRandomQuestions(questions, 10);
    pageController = PageController();
    score = 0;
    choose = false;
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: IconButton(
                    onPressed: () {
                      widget.spaceGame.overlays.remove('questions');
                      widget.spaceGame.router.pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.spaceGame.size.y - 50,
                  child: PageView.builder(
                    itemCount: currentQuestions.length,
                    itemBuilder: (context, index) => buildQuestion(
                      currentQuestions,
                      index,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildQuestion(List<Question> currentQuestions, int questionIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            currentQuestions[questionIndex].question,
            textAlign: TextAlign.center,
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: currentQuestions[questionIndex].answers.length,
            itemBuilder: (context, index) => InkWell(
              onTap: choose
                  ? null
                  : () {
                      setState(() {
                        choose = true;
                      });
                      if (currentQuestions[questionIndex].correctAnswer ==
                          index) {
                        score++;
                      }
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          setState(() {
                            choose = false;
                          });
                          if (currentQuestions.length - 1 != questionIndex) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }else{
                            widget.spaceGame.score = score;
                            widget.spaceGame.overlays.remove('questions');
                            widget.spaceGame.overlays.add('score');
                          }
                        },
                      );
                    },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: choose
                      ? currentQuestions[questionIndex].correctAnswer == index
                          ? Colors.green
                          : Colors.red
                      : null,
                ),
                child: Center(
                  child: Text(
                    currentQuestions[questionIndex].answers[index],
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
