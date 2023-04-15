import 'package:flutter/material.dart';

import 'main.dart';
import 'model/fruit.dart';

class FruitItemWidget extends StatelessWidget {
  const FruitItemWidget({
    super.key,
    required this.fruit,
    required this.index,
    required this.showDetails,
    required this.actualIndex,
  });

  final Fruit fruit;
  final int index;
  final int actualIndex;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: appDuration,
          top: _getTop(index, actualIndex),
          right: showDetails ? -350 : 0,
          left: 0,
          child: AnimatedRotation(
            duration: appDuration,
            turns: _getSlideTurn(index, actualIndex),
            child: AnimatedContainer(
              height: showDetails ? 350 : 250,
              duration: appDuration,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                fruit.image,
              ))),
            ),
          ),
        ),
      ],
    );
  }

  double _getTop(int currentIndex, actualCurrentIndex) => (currentIndex < actualCurrentIndex)
      ? 200 // passed
      : (currentIndex > actualCurrentIndex)
          ? 200
          : 0;
  double _getSlideTurn(int currentIndex, actualCurrentIndex) => (currentIndex < actualCurrentIndex)
      ? -0.1
      : (currentIndex > actualCurrentIndex)
          ? 0.2
          : 0;
}
