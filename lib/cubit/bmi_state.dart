/// BMI State - Holds all the data for BMI calculation
///
/// This is a simple state class that contains:
/// - User inputs (gender, weight, height, age)
/// - Calculated result (bmi value)
class BmiState {
  final String? gender; // 'Male' or 'Female'
  final int weight; // in kg
  final int height; // in cm
  final int age; // in years
  final double? bmi; // calculated BMI result

  // Constructor with default values
  const BmiState({
    this.gender,
    this.weight = 65,
    this.height = 170,
    this.age = 26,
    this.bmi,
  });

  // Copy method - creates a new state with updated values
  // This is important because Cubit requires immutable states
  BmiState copyWith({
    String? gender,
    int? weight,
    int? height,
    int? age,
    double? bmi,
  }) {
    return BmiState(
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      bmi: bmi ?? this.bmi,
    );
  }
}
