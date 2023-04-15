import 'package:flutter/material.dart';

import 'main.dart';

class OriginalDataWidget extends StatelessWidget {
  const OriginalDataWidget({
    super.key,
    required bool hasChanged,
  }) : _hasChanged = hasChanged;

  final bool _hasChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "DELIVER ON",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 550),
                left: 0,
                right: _hasChanged ? 0 : -90,
                child: Opacity(
                  opacity: _hasChanged ? 1 : 0,
                  child: Center(
                    child: Text(
                      "Tomorrow: 11:00 AM - 2:00 PM",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "MADE IN USE",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Text(
              '|',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Text(
                "TOTAL 12.00\$",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: appDuration2,
                left: 0,
                right: _hasChanged ? 0 : -90,
                child: Opacity(
                  opacity: _hasChanged ? 1 : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "Studies have long suggested that eating plant \n foods, such as eggplant, can boost \n overall health and wellbeing. \n Studies have long suggested that eating plant \n foods, such as eggplant, can boost \n overall health and wellbeing.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
