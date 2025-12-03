import 'package:flutter/material.dart';
import '../../../core/widgets/app_title.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/utils/colors.dart';
import 'widgets/bmi_result_card.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmi;
  final int weight;
  final int height;
  final int age;
  final String gender;

  const BMIResultScreen({
    super.key,
    required this.bmi,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const AppTitle(),
                  const SizedBox(height: 40),
                  BMIResultCard(
                    bmi: bmi,
                    weight: weight,
                    height: height,
                    age: age,
                    gender: gender,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PrimaryButton(
              text: 'Close',
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ),
        ],
      ),
    );
  }
}
