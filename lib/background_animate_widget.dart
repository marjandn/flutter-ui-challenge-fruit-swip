import 'dart:math';
import 'main.dart';
import 'package:flutter/material.dart';

class BackgroundAnimateWidget extends StatelessWidget {
  const BackgroundAnimateWidget({
    super.key,
    required ValueNotifier<int> currentFruitPosition,
  }) : _currentFruitPosition = currentFruitPosition;

  final ValueNotifier<int> _currentFruitPosition;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: _currentFruitPosition,
            builder: (context, value, child) => AnimatedRotation(
              duration: appDuration3,
              turns: pi * ((value + 1) * 0.02),
              child: Opacity(
                opacity: .5,
                child: Image.asset(
                  "assets/images/app_bg.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
