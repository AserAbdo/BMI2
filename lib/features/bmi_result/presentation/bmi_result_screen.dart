import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_title.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/utils/colors.dart';
import '../../../cubit/bmi_cubit.dart';
import '../../../cubit/bmi_state.dart';
import 'widgets/bmi_result_card.dart';

/// BMI Result Screen
///
/// Displays the calculated BMI result
/// All data comes from BmiCubit state - no parameters needed!
class BMIResultScreen extends StatelessWidget {
  const BMIResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // BlocBuilder to access state
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const AppTitle(),
                      const SizedBox(height: 40),
                      // Pass state values to the result card
                      BMIResultCard(
                        bmi: state.bmi ?? 0,
                        weight: state.weight,
                        height: state.height,
                        age: state.age,
                        gender: state.gender ?? '',
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
                    // Reset the cubit state when closing
                    context.read<BmiCubit>().reset();
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
