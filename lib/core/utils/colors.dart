import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryOrange = Colors.orange;
  static const Color primaryGreen = Colors.green;
  static const Color lightGreen = Color(0xFFE8F5E9);
  static const Color lightOrange = Color(0xFFFFF3E0);
  static const Color white = Colors.white;
  static const Color black87 = Colors.black87;
  static const Color grey = Colors.grey;

  static Color getBMICategoryColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }
}
