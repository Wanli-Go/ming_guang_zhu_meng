import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DynamicBackgroundScreen extends StatefulWidget {
  const DynamicBackgroundScreen({super.key});

  @override
  _DynamicBackgroundScreenState createState() => _DynamicBackgroundScreenState();
}

class _DynamicBackgroundScreenState extends State<DynamicBackgroundScreen> {
  Color _backgroundColorTop = Colors.pink.shade200.withOpacity(0.3);
  Color _backgroundColorBottom = Colors.pink.shade400.withOpacity(0.3);
  final Random _random = Random();

  // Function to generate a random pink color within a range
  Color getRandomPinkColor() {
    // Define the range for pink shades
    int r = 200 + _random.nextInt(56); // Range from 200 to 255
    int g = _random.nextInt(100);       // Range from 0 to 100
    int b = _random.nextInt(100);       // Range from 0 to 100
    return Color.fromRGBO(r, g, b, 1);
  }

  @override
  void initState() {
    super.initState();
    // Update the background color every 2 seconds
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _backgroundColorTop = getRandomPinkColor().withOpacity(0.3);
        _backgroundColorBottom = getRandomPinkColor().withOpacity(0.3);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 5),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_backgroundColorTop, _backgroundColorBottom],
          ),
        ),
      ),
    );
  }
}
