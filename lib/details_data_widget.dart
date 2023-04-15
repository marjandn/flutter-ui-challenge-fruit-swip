import 'package:flutter/material.dart';
import 'main.dart';

class DetailsDataWidget extends StatelessWidget {
  const DetailsDataWidget({
    super.key,
    required bool showDetailsInfo,
  }) : _showDetailsInfo = showDetailsInfo;

  final bool _showDetailsInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            left: 0,
            top: _showDetailsInfo ? 0 : 60,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: _showDetailsInfo ? 1 : 0,
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Text(
                      "DELIVER ON ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "     Tommorow 3:00 PM - 4:00 PM",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: appDuration4,
            left: 0,
            top: _showDetailsInfo ? 50 : 110,
            child: AnimatedOpacity(
              duration: appDuration4,
              opacity: _showDetailsInfo ? 1 : 0,
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Text(
                      "MADE IN USE",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Text(
                      '     |     ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "TOTAL 12.00\$",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: appDuration3,
            left: 0,
            top: _showDetailsInfo ? 100 : 160,
            child: AnimatedOpacity(
              duration: appDuration3,
              opacity: _showDetailsInfo ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Studies have long suggested that eating plant \nfoods, such as eggplant, can boost overall health\nand wellbeing. Studies have long suggested that\neating plant foods, such as eggplant, can boost \noverall health and wellbeing.",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    width: 400,
                    child: Divider(
                      height: 0.5,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: appDuration2,
            left: 0,
            top: _showDetailsInfo ? 240 : 300,
            child: AnimatedOpacity(
              duration: appDuration2,
              opacity: _showDetailsInfo ? 1 : 0,
              child: Text(
                "MORE ABOUT FRUIT",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: appDuration,
            left: 0,
            top: _showDetailsInfo ? 280 : 360,
            child: AnimatedOpacity(
              duration: appDuration,
              opacity: _showDetailsInfo ? 1 : 0,
              child: Text(
                "In publishing and graphic design, Lorem ipsum \nis a placeholder text commonly used to \ndemonstrate the visual form of a document or\na typeface without relying on meaningful.\nLorem ipsum may be used as a placeholder \nbefore final copy is available",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
