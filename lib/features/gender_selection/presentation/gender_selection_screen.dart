import 'package:flutter/material.dart';
import '../../../core/widgets/app_title.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/utils/colors.dart';
import '../../bmi_input/presentation/bmi_input_screen.dart';
import 'widgets/gender_card.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const AppTitle(),
                  const SizedBox(height: 40),
                  const Text(
                    'Please choose your gender',
                    style: TextStyle(fontSize: 18, color: AppColors.black87),
                  ),
                  const SizedBox(height: 40),
                  GenderCard(
                    gender: 'Male',
                    imagePath: 'assets/male.png',
                    isSelected: selectedGender == 'Male',
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  GenderCard(
                    gender: 'Female',
                    imagePath: 'assets/female.png',
                    isSelected: selectedGender == 'Female',
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
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
              text: 'Continue',
              onPressed: selectedGender != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BMIInputScreen(gender: selectedGender!),
                        ),
                      );
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
