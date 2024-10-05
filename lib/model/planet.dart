class Planet {
  String name;
  String description;
  String? astronautQuote;
  String explanation;
  String? robotInteraction;
  String? robotExplanation;
  String? moonDescription;

  Planet({
    required this.name,
    required this.description,
    this.astronautQuote,
    required this.explanation,
    this.robotInteraction,
    this.robotExplanation,
    this.moonDescription,
  });

  static List<Planet> planets = [
    Planet(
      name: 'Mercury',
      description: 'The spacecraft landed on the surface of Mercury, the smallest planet in the solar system and the closest to the Sun. It was extremely hot during the day and freezing cold at night.',
      astronautQuote: '“I didn’t imagine Mercury would be this hot!”',
      explanation: 'Mercury doesn’t have an atmosphere to protect it, so the weather changes drastically between day and night. It also rotates very slowly, so days can last for months!',
    ),
    Planet(
      name: 'Venus',
      description: 'The astronaut arrived at Venus, a planet filled with thick clouds. Upon landing, it was found that the air was hot, hazy, and filled with toxic gases.',
      astronautQuote: '“Venus is beautiful from afar, but it’s hard to live here!”',
      explanation: 'Venus has a very dense atmosphere that traps heat, making it the hottest planet in the solar system. Even the rain here is made of sulfuric acid!',
    ),
    Planet(
      name: 'Earth',
      description: 'The astronaut returned to Earth briefly to catch some breath. The fresh air and blue sky were familiar, and there was a sense of gratitude for being on this unique planet.',
      explanation: 'Earth is the only known place so far that contains life, thanks to its atmosphere and water!',
    ),
    Planet(
      name: 'Mars',
      description: 'When the astronaut landed on Mars, it felt like a completely different world. Red sands and large rocks covered the surface.',
      explanation: 'Mars is called the Red Planet because of its iron-rich soil.',
      robotInteraction: 'While exploring, robots were seen digging into the ground. The astronaut asked: “What are these robots doing?”',
      robotExplanation: 'They’re searching for frozen water beneath the surface, and there might be clues to ancient life!',
    ),
    Planet(
      name: 'Jupiter',
      description: 'As the astronaut approached Jupiter, the massive, colorful stripes became visible. This planet was gigantic compared to Earth! A huge storm was observed swirling on its surface, larger than Earth itself.',
      explanation: 'This storm is called the Great Red Spot, and it has been raging for hundreds of years.',
    ),
    Planet(
      name: 'Saturn',
      description: 'The astronaut was excited to see Saturn up close, and its bright rings were as expected.',
      explanation: 'These rings are made of ice and small rocks, orbiting Saturn at incredible speeds.',
      moonDescription: 'The spacecraft landed on Titan, one of Saturn’s largest moons, which was shrouded in thick clouds and had lakes of liquid methane instead of water!',
    ),
    Planet(
      name: 'Uranus',
      description: 'Uranus spun in an unusual way, tilted on its side.',
      explanation: 'Uranus is the only planet that rotates like this. Its atmosphere contains gases that give it this cool blue color.',
    ),
    Planet(
      name: 'Neptune',
      description: 'Upon reaching Neptune, massive storms were seen swirling in its atmosphere. Neptune was very far from the Sun, making it extremely cold.',
      explanation: 'Neptune is the farthest planet in the solar system and has the fastest winds of any planet.',
    ),
  ];

  static Planet? getPlanetByName(String name) {
    for (var planet in planets) {
      if (planet.name.toLowerCase() == name.toLowerCase()) {
        return planet;
      }
    }
    return null; // Return null if no planet is found with that name
  }
}
