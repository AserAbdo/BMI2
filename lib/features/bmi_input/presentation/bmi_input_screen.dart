import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_title.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/utils/colors.dart';
import '../../../cubit/bmi_cubit.dart';
import '../../../cubit/bmi_state.dart';
import '../../bmi_result/presentation/bmi_result_screen.dart';
import 'widgets/value_card.dart';
import 'widgets/height_slider_card.dart';

/// BMI Input Screen
///
/// Uses BlocBuilder to rebuild UI when state changes
/// All values (weight, height, age) are managed by BmiCubit
class BMIInputScreen extends StatelessWidget {
  const BMIInputScreen({super.key});

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
      // BlocBuilder rebuilds only when state changes
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Please Modify the values',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.black87,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: ValueCard(
                              label: 'Weight (kg)',
                              value: state.weight,
                              onIncrement: () {
                                // Call cubit method
                                context.read<BmiCubit>().incrementWeight();
                              },
                              onDecrement: () {
                                // Call cubit method
                                context.read<BmiCubit>().decrementWeight();
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ValueCard(
                              label: 'Age',
                              value: state.age,
                              onIncrement: () {
                                // Call cubit method
                                context.read<BmiCubit>().incrementAge();
                              },
                              onDecrement: () {
                                // Call cubit method
                                context.read<BmiCubit>().decrementAge();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      HeightSliderCard(
                        height: state.height,
                        onChanged: (value) {
                          // Call cubit method
                          context.read<BmiCubit>().updateHeight(value.round());
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
                    // Calculate BMI using cubit
                    context.read<BmiCubit>().calculateBmi();

                    // Navigate to result screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BMIResultScreen(),
                      ),
                    );
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
