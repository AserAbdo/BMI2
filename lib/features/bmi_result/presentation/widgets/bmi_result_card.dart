import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/bmi_calculator.dart';

class BMIResultCard extends StatelessWidget {
  final double bmi;
  final int weight;
  final int height;
  final int age;
  final String gender;

  const BMIResultCard({
    super.key,
    required this.bmi,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final category = BMICalculator.getBMICategory(bmi);
    final categoryColor = AppColors.getBMICategoryColor(bmi);
    final healthyWeight = BMICalculator.getHealthyWeightRange(height);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Your BMI:',
            style: TextStyle(fontSize: 18, color: AppColors.black87),
          ),
          const SizedBox(height: 20),
          Text(
            bmi.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryGreen,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _InfoColumn(label: 'Weight', value: '$weight kg'),
              _InfoColumn(label: 'Height', value: '$height cm'),
              _InfoColumn(label: 'Age', value: '$age'),
              _InfoColumn(label: 'Gender', value: gender.toLowerCase()),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Healthy weight for the height:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            healthyWeight,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.grey),
        ),
      ],
    );
  }
}
