import 'dart:math';

enum Gender { male, female }

enum ActivityLevel {
  sedentary,
  light,
  moderate,
  active,
  veryActive,
}

enum GoalType {
  loseWeight,
  maintain,
  gainWeight,
}

class Calculations {
  Calculations._();

  static double bmi({
    required double weightKg,
    required double heightCm,
  }) {
    if (heightCm <= 0 || weightKg <= 0) return 0;
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  static String bmiCategory(double bmi) {
    if (bmi < 16.0) return 'Severely Underweight';
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Overweight';
    if (bmi < 35.0) return 'Obese Class I';
    if (bmi < 40.0) return 'Obese Class II';
    return 'Obese Class III';
  }

  static double bmrMifflinStJeor({
    required double weightKg,
    required double heightCm,
    required int age,
    required Gender gender,
  }) {
    if (weightKg <= 0 || heightCm <= 0 || age <= 0) return 0;
    final s = gender == Gender.male ? 5 : -161;
    return (10 * weightKg) + (6.25 * heightCm) - (5 * age) + s;
  }

  static double tdee({
    required double bmr,
    required ActivityLevel activityLevel,
  }) {
    final multipliers = {
      ActivityLevel.sedentary: 1.2,
      ActivityLevel.light: 1.375,
      ActivityLevel.moderate: 1.55,
      ActivityLevel.active: 1.725,
      ActivityLevel.veryActive: 1.9,
    };
    return bmr * (multipliers[activityLevel] ?? 1.2);
  }

  static double bmrKatchMcArdle({
    required double weightKg,
    required double bodyFatPercent,
  }) {
    if (weightKg <= 0 || bodyFatPercent < 0) return 0;
    final leanMass = weightKg * (1 - (bodyFatPercent / 100));
    return 370 + (21.6 * leanMass);
  }

  static Macros calculateMacros({
    required double tdee,
    required GoalType goal,
    required double weightKg,
    double? bodyFatPercent,
  }) {
    double calorieAdjustment;
    switch (goal) {
      case GoalType.loseWeight:
        calorieAdjustment = -500;
      case GoalType.gainWeight:
        calorieAdjustment = 300;
      case GoalType.maintain:
        calorieAdjustment = 0;
    }

    final targetCalories = tdee + calorieAdjustment;
    final protein = weightKg * 2.2;
    final fat = targetCalories * 0.25 / 9;
    final remainingCalories = targetCalories - (protein * 4) - (fat * 9);
    final carbs = remainingCalories / 4;

    return Macros(
      calories: targetCalories.round(),
      proteinG: protein.round(),
      carbsG: carbs.round(),
      fatG: fat.round(),
    );
  }

  static double idealBodyWeight({
    required double heightCm,
    required Gender gender,
  }) {
    final heightInches = heightCm / 2.54;
    final baseWeight = 50.0;
    final weightPerInch = 2.3;
    final inchesOver5ft = heightInches - 60;
    final adjustment = inchesOver5ft * weightPerInch;
    if (gender == Gender.male) {
      return baseWeight + 2.3 + adjustment;
    }
    return baseWeight + adjustment;
  }

  static double oneRepMax({
    required double weight,
    required int reps,
  }) {
    if (reps == 1) return weight;
    if (reps <= 0 || weight <= 0) return 0;
    return weight * (1 + (reps / 30));
  }

  static double wilksScore({
    required double totalLiftedKg,
    required double bodyWeightKg,
    required Gender gender,
  }) {
    final coeff = gender == Gender.male
        ? -216.0475144 +
            (16.2606339 * bodyWeightKg) -
            (0.002388645 * pow(bodyWeightKg, 2)) -
            (0.00113732 * pow(bodyWeightKg, 3)) +
            (7.01863e-6 * pow(bodyWeightKg, 4)) -
            (1.291e-8 * pow(bodyWeightKg, 5))
        : 594.31747775582 -
            (27.23842536447 * bodyWeightKg) +
            (0.82112226871 * pow(bodyWeightKg, 2)) -
            (0.00930733913 * pow(bodyWeightKg, 3)) +
            (4.731582e-5 * pow(bodyWeightKg, 4)) -
            (9.054e-8 * pow(bodyWeightKg, 5));
    if (coeff == 0) return 0;
    return totalLiftedKg * (500 / coeff);
  }

  static double calorieDeficit({
    required double tdee,
    required double targetCalories,
  }) {
    return tdee - targetCalories;
  }

  static double waterIntakeLiters({
    required double weightKg,
    bool isAthlete = false,
  }) {
    final base = weightKg * 0.033;
    return isAthlete ? base + 0.5 : base;
  }

  static double bodyFatFromSkinfold({
    required double sumSkinfolds,
    required int age,
    required Gender gender,
  }) {
    final density = gender == Gender.male
        ? 1.10938 -
            (0.0008267 * sumSkinfolds) +
            (0.0000016 * pow(sumSkinfolds, 2)) -
            (0.0002574 * age)
        : 1.0994921 -
            (0.0009929 * sumSkinfolds) +
            (0.0000023 * pow(sumSkinfolds, 2)) -
            (0.0001392 * age);
    if (density <= 0) return 0;
    return (495 / density) - 450;
  }
}

class Macros {
  final int calories;
  final int proteinG;
  final int carbsG;
  final int fatG;

  const Macros({
    required this.calories,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
  });

  Macros copyWith({
    int? calories,
    int? proteinG,
    int? carbsG,
    int? fatG,
  }) {
    return Macros(
      calories: calories ?? this.calories,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      fatG: fatG ?? this.fatG,
    );
  }

  Map<String, dynamic> toJson() => {
        'calories': calories,
        'proteinG': proteinG,
        'carbsG': carbsG,
        'fatG': fatG,
      };

  factory Macros.fromJson(Map<String, dynamic> json) => Macros(
        calories: json['calories'] as int,
        proteinG: json['proteinG'] as int,
        carbsG: json['carbsG'] as int,
        fatG: json['fatG'] as int,
      );
}
