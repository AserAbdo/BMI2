import 'package:flutter/material.dart';
import '../../../core/widgets/app_title.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/bmi_calculator.dart';
import '../../bmi_result/presentation/bmi_result_screen.dart';
import 'widgets/value_card.dart';
import 'widgets/height_slider_card.dart';

class BMIInputScreen extends StatefulWidget {
  final String gender;

  const BMIInputScreen({super.key, required this.gender});

  @override
  State<BMIInputScreen> createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  int weight = 65;
  int age = 26;
  int height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppTitle(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Please Modify the values',
                    style: TextStyle(fontSize: 18, color: AppColors.black87),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: ValueCard(
                          label: 'Weight (kg)',
                          value: weight,
                          onIncrement: () {
                            setState(() {
                              weight++;
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              if (weight > 1) weight--;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ValueCard(
                          label: 'Age',
                          value: age,
                          onIncrement: () {
                            setState(() {
                              age++;
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              if (age > 1) age--;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  HeightSliderCard(
                    height: height,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PrimaryButton(
              text: 'Calculate',
              onPressed: () {
                double bmi = BMICalculator.calculateBMI(weight, height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResultScreen(
                      bmi: bmi,
                      weight: weight,
                      height: height,
                      age: age,
                      gender: widget.gender,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
