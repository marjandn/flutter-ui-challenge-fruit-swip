import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_swip_transition/model/fruit.dart';
import 'background_animate_widget.dart';
import 'fruit_item_widget.dart';
import 'fruit_name_widget.dart';
import 'top_bar_widget.dart';
import 'weight_widget.dart';
import 'details_data_widget.dart';
import 'original_data_widget.dart';

const Duration appDuration = Duration(milliseconds: 800);
const Duration appDuration2 = Duration(milliseconds: 700);
const Duration appDuration3 = Duration(milliseconds: 600);
const Duration appDuration4 = Duration(milliseconds: 500);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Swip Transition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final List<Fruit> _fruits = Fruit.populateData();
  final ValueNotifier<int> _currentFruitPosition = ValueNotifier(0);

  final _fruitsController = PageController(viewportFraction: .99);

  bool _pageHasChanged = true;
  bool _showDetailsBody = false;
  bool _showDetailsInfo = false;

  Future<void> _goNextItem() async {
    if ((_currentFruitPosition.value + 1) < _fruits.length) {
      _currentFruitPosition.value++;

      _fruitsController
          .animateToPage(_currentFruitPosition.value, duration: appDuration, curve: Curves.linear)
          .whenComplete(() => setState(() {
                _pageHasChanged = true;
              }));
    } else {
      setState(() {
        _pageHasChanged = true;
      });
    }
  }

  Future<void> _goPreviusItem() async {
    if ((_currentFruitPosition.value - 1) >= 0) {
      _currentFruitPosition.value--;

      _fruitsController
          .animateToPage(_currentFruitPosition.value, duration: appDuration, curve: Curves.linear)
          .whenComplete(() => setState(() {
                _pageHasChanged = true;
              }));
    } else {
      setState(() {
        _pageHasChanged = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroundAnimateWidget(currentFruitPosition: _currentFruitPosition),
        const TopBarWidget(),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: appDuration,
            height: MediaQuery.of(context).size.height * (_showDetailsBody ? 1 : 0.80),
            child: Stack(children: [
              ValueListenableBuilder(
                valueListenable: _currentFruitPosition,
                builder: (context, value, child) => AnimatedContainer(
                  duration: appDuration,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: _showDetailsBody ? 0 : 150),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: _fruits[value].bgColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(_showDetailsBody ? 0 : 150),
                      topLeft: Radius.circular(_showDetailsBody ? 0 : 150),
                    ),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    AnimatedSize(
                      duration: appDuration,
                      child: SizedBox(height: _showDetailsBody ? 200 : 100),
                    ),
                    FruitNameWidget(
                        index: value,
                        showDetails: _showDetailsBody,
                        hasChanged: _pageHasChanged,
                        fruits: _fruits),
                    WeightWidget(index: value, showDetails: _showDetailsBody, fruits: _fruits),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: _showDetailsBody
                          ? DetailsDataWidget(showDetailsInfo: _showDetailsInfo)
                          : OriginalDataWidget(hasChanged: _pageHasChanged),
                    ),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) async {
                    if (!_showDetailsBody) {
                      if (details.delta.dx < 0) {
                        if (_pageHasChanged) {
                          setState(() {
                            _pageHasChanged = false;
                          });
                          await _goNextItem();
                        }
                      } else {
                        if (_pageHasChanged) {
                          setState(() {
                            _pageHasChanged = false;
                          });
                          await _goPreviusItem();
                        }
                      }
                    }
                  },
                  onVerticalDragUpdate: (details) async {
                    if (_pageHasChanged) {
                      if (details.delta.dy < 0) {
                        setState(() {
                          _showDetailsBody = true;
                          Timer(
                            const Duration(milliseconds: 820),
                            () {
                              setState(() {
                                _showDetailsInfo = true;
                              });
                            },
                          );
                        });
                      } else {
                        setState(() {
                          _showDetailsBody = false;
                          _showDetailsInfo = false;
                        });
                      }
                    }
                  },
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentFruitPosition,
                    builder: (context, actualIndex, child) => PageView.builder(
                        itemCount: _fruits.length,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _fruitsController,
                        itemBuilder: (context, index) {
                          return FruitItemWidget(
                              fruit: _fruits[index],
                              index: index,
                              actualIndex: actualIndex,
                              showDetails: _showDetailsBody);
                        }),
                  ),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
