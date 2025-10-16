import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_application/core/app_constants.dart';
import 'package:test_application/core/app_spacing.dart';
import 'package:test_application/widgets/color_controller.dart';

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
  final List<Color> listOfColors = [];
  int selectedColor = -1;

  @override
  void initState() {
    super.initState();
    _createRandomRgb();
  }

  void _createRandomRgb() {
    final r = random.nextInt(AppConstants.rgbBoundary);
    final g = random.nextInt(AppConstants.rgbBoundary);
    final b = random.nextInt(AppConstants.rgbBoundary);
    final newColor = Color.fromARGB(255, r, g, b);

    setState(() {
      listOfColors.add(newColor);
      selectedColor++;
    });
  }

  void previousColor() {
    setState(() {
      if (selectedColor > 0) {
        selectedColor--;
      }
    });
  }

  void nextColor() {
    setState(() {
      if (selectedColor < listOfColors.length - 1) {
        selectedColor++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = listOfColors[selectedColor];
    final textColor =
        backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return MaterialApp(
      home: GestureDetector(
        onTap: _createRandomRgb,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.s),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppSpacing.l,
                children: [
                  Expanded(
                    child: ColorController(
                      icon: Icons.arrow_back,
                      text: 'Previous color',
                      isShown: selectedColor > 0,
                      onTap: previousColor,
                      color: textColor,
                    ),
                  ),
                  Text(
                    'Hello World!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor),
                  ),
                  Expanded(
                    child: ColorController(
                      icon: Icons.arrow_forward,
                      text: 'Next color',
                      isShown: selectedColor < listOfColors.length - 1,
                      onTap: nextColor,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
