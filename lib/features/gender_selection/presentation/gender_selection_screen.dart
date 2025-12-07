import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_title.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/utils/colors.dart';
import '../../../cubit/bmi_cubit.dart';
import '../../../cubit/bmi_state.dart';
import '../../bmi_input/presentation/bmi_input_screen.dart';
import 'widgets/gender_card.dart';

/// Gender Selection Screen
///
/// Uses BlocBuilder to rebuild UI when state changes
/// No need for StatefulWidget anymore - Cubit handles the state!
class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // BlocBuilder rebuilds only when state changes
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Column(
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
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.black87,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GenderCard(
                        gender: 'Male',
                        imagePath: 'assets/male.png',
                        isSelected: state.gender == 'Male',
                        onTap: () {
                          // Call cubit method to update state
                          context.read<BmiCubit>().selectGender('Male');
                        },
                      ),
                      const SizedBox(height: 30),
                      GenderCard(
                        gender: 'Female',
                        imagePath: 'assets/female.png',
                        isSelected: state.gender == 'Female',
                        onTap: () {
                          // Call cubit method to update state
                          context.read<BmiCubit>().selectGender('Female');
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
                  // Button enabled only when gender is selected
                  onPressed: state.gender != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BMIInputScreen(),
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
