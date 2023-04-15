import 'package:flutter/material.dart';

import 'main.dart';
import 'model/fruit.dart';

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    super.key,
    required this.index,
    required bool showDetails,
    required List<Fruit> fruits,
  })  : _showDetails = showDetails,
        _fruits = fruits;

  final int index;
  final bool _showDetails;
  final List<Fruit> _fruits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 8,
              child: AnimatedContainer(
                width: _showDetails ? 0 : 80,
                duration: appDuration3,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  color: Color.fromARGB(141, 255, 255, 255),
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: _showDetails ? 0 : 24,
                ),
              ),
            ),
            AnimatedAlign(
              duration: appDuration,
              alignment: _showDetails ? Alignment.topLeft : Alignment.topCenter,
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 1),
                tween: Tween<double>(
                    begin: _fruits[index].weight,
                    end: _fruits[(index > 0 ? (index - 1) : (_fruits.length - 1))].weight),
                builder: (context, numberText, child) => Text(
                  numberText.round().toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            AnimatedPositioned(
                duration: appDuration,
                top: _showDetails ? 30 : 50,
                right: 0,
                left: _showDetails ? -110 : 0,
                child: Center(
                  child: Text(
                    "gram",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                  ),
                )),
            Positioned(
              left: 0,
              top: 8,
              child: AnimatedContainer(
                width: _showDetails ? 0 : 80,
                duration: appDuration3,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  color: Color.fromARGB(141, 255, 255, 255),
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: _showDetails ? 0 : 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
