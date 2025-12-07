import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'bmi_state.dart';

/// BMI Cubit - Manages all the business logic for BMI calculation
///
/// Cubit is simpler than Bloc because:
/// - It uses methods instead of events
/// - Easier to understand and explain
/// - Perfect for simple state management
class BmiCubit extends Cubit<BmiState> {
  // Initialize with default state
  BmiCubit() : super(const BmiState());

  // ============ METHODS (Actions user can take) ============

  /// Select gender ('Male' or 'Female')
  void selectGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  /// Increase weight by 1
  void incrementWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  /// Decrease weight by 1 (minimum 1)
  void decrementWeight() {
    if (state.weight > 1) {
      emit(state.copyWith(weight: state.weight - 1));
    }
  }

  /// Increase age by 1
  void incrementAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  /// Decrease age by 1 (minimum 1)
  void decrementAge() {
    if (state.age > 1) {
      emit(state.copyWith(age: state.age - 1));
    }
  }

  /// Update height from slider
  void updateHeight(int height) {
    emit(state.copyWith(height: height));
  }

  /// Calculate BMI using the formula: weight / (height in meters)²
  void calculateBmi() {
    double heightInMeters = state.height / 100;
    double bmi = state.weight / pow(heightInMeters, 2);
    emit(state.copyWith(bmi: bmi));
  }

  /// Reset to initial state (for starting over)
  void reset() {
    emit(const BmiState());
  }

  // ============ HELPER METHODS (For displaying results) ============

  /// Get BMI category based on BMI value
  String getBmiCategory() {
    if (state.bmi == null) return '';
    if (state.bmi! < 18.5) return 'Underweight';
    if (state.bmi! < 25) return 'Normal';
    if (state.bmi! < 30) return 'Overweight';
    return 'Obese';
  }

  /// Get healthy weight range for current height
  String getHealthyWeightRange() {
    double heightInMeters = state.height / 100;
    double minWeight = 18.5 * pow(heightInMeters, 2);
    double maxWeight = 24.9 * pow(heightInMeters, 2);
    return '${minWeight.toStringAsFixed(1)} kg - ${maxWeight.toStringAsFixed(1)} kg';
  }
}
