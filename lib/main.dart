import 'dart:math';

import 'package:flutter/material.dart';

const rgbBoundary = 256;
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final random = Random();
  Color _createRandomRgb() {
    final r = random.nextInt(rgbBoundary);
    final g = random.nextInt(rgbBoundary);
    final b = random.nextInt(rgbBoundary);

    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          setState(() {
            _createRandomRgb();
          });
        },
        child: Scaffold(
          backgroundColor: _createRandomRgb(),
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
