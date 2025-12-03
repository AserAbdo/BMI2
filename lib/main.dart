import 'package:flutter/material.dart';
import 'features/gender_selection/presentation/gender_selection_screen.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      home: const GenderSelectionScreen(),
    );
  }
}
