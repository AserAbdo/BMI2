import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bmi_cubit.dart';
import 'features/gender_selection/presentation/gender_selection_screen.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider makes BmiCubit available to all screens
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: MaterialApp(
        title: 'BMI Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
        home: const GenderSelectionScreen(),
      ),
    );
  }
}
