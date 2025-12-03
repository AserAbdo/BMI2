import 'dart:math';

class BMICalculator {
  static double calculateBMI(int weight, int height) {
    return weight / pow(height / 100, 2);
  }

  static String getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  static String getHealthyWeightRange(int height) {
    double heightInMeters = height / 100;
    double minWeight = 18.5 * pow(heightInMeters, 2);
    double maxWeight = 24.9 * pow(heightInMeters, 2);
    return '${minWeight.toStringAsFixed(1)} kg - ${maxWeight.toStringAsFixed(1)} kg';
  }
}
