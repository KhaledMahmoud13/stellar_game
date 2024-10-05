import 'dart:math';

class Question {
  final int id;
  final String question;
  final List<String> answers;
  final int correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

List<Question> questions = [
  Question(
    id: 1,
    question: "What is the smallest planet in the solar system?",
    answers: ["Venus", "Earth", "Mercury", "Mars"],
    correctAnswer: 2,
  ),
  Question(
    id: 2,
    question:
        "Why does Mercury experience extreme temperature changes between day and night?",
    answers: [
      "It has a thick atmosphere.",
      "It is the closest planet to the Sun.",
      "It rotates very quickly.",
      "It has no atmosphere."
    ],
    correctAnswer: 3,
  ),
  Question(
    id: 3,
    question: "What happens to temperatures on Mercury at night?",
    answers: [
      "They remain the same as during the day.",
      "They become extremely cold.",
      "They become warm and humid.",
      "They rise dramatically."
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 4,
    question: "How long can a day last on Mercury?",
    answers: ["A few hours", "A few days", "Months", "Years"],
    correctAnswer: 2,
  ),
  Question(
    id: 5,
    question: "What is the atmosphere of Venus primarily composed of?",
    answers: ["Oxygen", "Nitrogen", "Toxic gases", "Hydrogen"],
    correctAnswer: 2,
  ),
  Question(
    id: 6,
    question: "What dangerous component is found in the rain on Venus?",
    answers: ["Water", "Sulfuric acid", "Ammonia", "Methane"],
    correctAnswer: 1,
  ),
  Question(
    id: 7,
    question: "What did the astronaut note about living conditions on Venus?",
    answers: [
      "It is very pleasant.",
      "It is extremely hot and hazardous.",
      "It is cold and windy.",
      "It is similar to Earth."
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 8,
    question: "What makes Earth unique among the planets discussed?",
    answers: [
      "It is the largest planet.",
      "It is the only known planet to support life.",
      "It has rings.",
      "It has no atmosphere."
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 9,
    question:
        "What familiar sights did the astronaut see upon returning to Earth?",
    answers: [
      "Mountains and valleys",
      "Blue sky and fresh air",
      "Red sands and rocks",
      "Thick clouds"
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 10,
    question: "What essential element does Earth have that supports life?",
    answers: ["Rings", "Water", "Oxygen", "Ice"],
    correctAnswer: 1,
  ),
  Question(
    id: 11,
    question: "What distinctive feature gives Mars its nickname?",
    answers: ["Blue Planet", "Red Planet", "Green Planet", "Yellow Planet"],
    correctAnswer: 1,
  ),
  Question(
    id: 12,
    question: "What color is the soil on Mars, contributing to its nickname?",
    answers: ["Green", "Red", "Blue", "Yellow"],
    correctAnswer: 1,
  ),
  Question(
    id: 13,
    question: "What did the astronaut inquire about the robots on Mars?",
    answers: [
      "“Where are these robots going?”",
      "“What are these robots doing?”",
      "“How do these robots work?”",
      "“Who built these robots?”"
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 14,
    question: "What were the robots on Mars searching for?",
    answers: ["Minerals", "Frozen water", "Alien life", "Treasure"],
    correctAnswer: 1,
  ),
  Question(
    id: 15,
    question: "How does the size of Jupiter compare to Earth?",
    answers: [
      "It is smaller.",
      "It is about the same size.",
      "It is much larger.",
      "It is slightly larger."
    ],
    correctAnswer: 2,
  ),
  Question(
    id: 16,
    question: "What notable storm is observed on Jupiter?",
    answers: [
      "Great Blue Spot",
      "Great Green Spot",
      "Great Red Spot",
      "Great Yellow Spot"
    ],
    correctAnswer: 2,
  ),
  Question(
    id: 17,
    question: "What visual characteristics make Jupiter stand out?",
    answers: [
      "Its rings",
      "Its colorful stripes",
      "Its small size",
      "Its moons"
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 18,
    question: "What are Saturn's rings primarily made of?",
    answers: ["Dust and gas", "Ice and small rocks", "Water vapor", "Metal"],
    correctAnswer: 1,
  ),
  Question(
    id: 19,
    question: "What unique feature was found on Titan, Saturn's largest moon?",
    answers: [
      "Lakes of liquid water",
      "Mountains made of ice",
      "Lakes of liquid methane",
      "Large forests"
    ],
    correctAnswer: 2,
  ),
  Question(
    id: 20,
    question: "Which planet has an unusual rotation, spinning on its side?",
    answers: ["Neptune", "Jupiter", "Uranus", "Saturn"],
    correctAnswer: 2,
  ),
  Question(
    id: 21,
    question:
        "What is the main gas in Uranus's atmosphere that gives it a blue color?",
    answers: ["Methane", "Hydrogen", "Helium", "Nitrogen"],
    correctAnswer: 0,
  ),
  Question(
    id: 22,
    question: "What kind of weather phenomena were observed on Neptune?",
    answers: ["Heavy snowfall", "Massive storms", "Tornadoes", "Hurricanes"],
    correctAnswer: 1,
  ),
  Question(
    id: 23,
    question: "What distinguishes Neptune in terms of distance from the Sun?",
    answers: [
      "It is the closest planet.",
      "It is the furthest planet.",
      "It is at the center of the solar system.",
      "It orbits very close to Saturn."
    ],
    correctAnswer: 1,
  ),
  Question(
    id: 24,
    question: "What is a notable feature of Neptune’s winds?",
    answers: [
      "They are very slow.",
      "They are the fastest of any planet.",
      "They change direction frequently.",
      "They have no effect on the atmosphere."
    ],
    correctAnswer: 1,
  ),
];

List<Question> getRandomQuestions(List<Question> questions, int count) {
  final List<Question> shuffledQuestions = List.from(questions);

  shuffledQuestions.shuffle(Random());
  return shuffledQuestions.take(count).toList();
}
