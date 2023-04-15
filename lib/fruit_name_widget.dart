import 'package:flutter/material.dart';

import 'main.dart';
import 'model/fruit.dart';

class FruitNameWidget extends StatelessWidget {
  const FruitNameWidget({
    super.key,
    required this.index,
    required bool showDetails,
    required bool hasChanged,
    required List<Fruit> fruits,
  })  : _showDetails = showDetails,
        _hasChanged = hasChanged,
        _fruits = fruits;

  final int index;
  final bool _showDetails;
  final bool _hasChanged;
  final List<Fruit> _fruits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            left: _showDetails ? -150 : 0,
            right: _hasChanged ? 0 : -90,
            child: Opacity(
              opacity: _hasChanged ? 1 : 0,
              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: appDuration,
                  style: TextStyle(
                    fontSize: _showDetails ? 50 : 24,
                    fontWeight: _showDetails ? FontWeight.bold : FontWeight.normal,
                    color: Colors.white,
                  ),
                  child: Text(
                    _fruits[index].name,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
