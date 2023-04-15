import 'package:flutter/material.dart';

class Fruit {
  final int id;
  final String image;
  final Color bgColor;
  final String name;
  final double weight;

  const Fruit(this.id, this.image, this.bgColor, this.name, this.weight);

  static List<Fruit> populateData() => const [
        Fruit(1, 'assets/images/avacado.png', Color.fromARGB(250, 76, 175, 79), 'Avacado', 220),
        Fruit(1, 'assets/images/orange.png', Color.fromARGB(250, 255, 153, 0), 'Orange', 260),
        Fruit(1, 'assets/images/lemon.png', Color.fromARGB(250, 165, 214, 167), 'lemon', 320),
      ];
}
