import 'dart:math';

import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(4, 255, 255, 255)])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Transform.rotate(
                  angle: -pi,
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.red,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
          ),
        ]),
      ),
    );
  }
}
