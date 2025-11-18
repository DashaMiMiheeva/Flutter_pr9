import 'package:flutter_bloc/flutter_bloc.dart';

enum Goal { lose, maintain, gain }

class CalculatorState {
  final Goal goal;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final double activity;


  const CalculatorState({
    required this.goal,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.activity,
  });

  CalculatorState copyWith({
    Goal? goal,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    double? activity,
  }) {
    return CalculatorState(
      goal: goal ?? this.goal,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      activity: activity ?? this.activity,
    );
  }
}

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState(goal: Goal.maintain, calories: 0, protein: 0, fat: 0, carbs: 0, activity: 0));

  void updateGoal(Goal goal) => emit(state.copyWith(goal: goal));

  void calculate({
    required int weight,
    required int height,
    required int age,
    required String sex,
    required double activityLevel,
  }) {
    double bmr;
    if (sex == "male") {
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }

    double multiplier = activityLevel;

    double calories = bmr * multiplier;

    switch (state.goal) {
      case Goal.lose:
        calories *= 0.8;
        break;
      case Goal.maintain:
        break;
      case Goal.gain:
        calories *= 1.2;
        break;
    }

    double protein = calories * 0.3 / 4;
    double fat = calories * 0.25 / 9;
    double carbs = calories * 0.45 / 4;

    emit(state.copyWith(
      calories: calories,
      protein: protein,
      fat: fat,
      carbs: carbs,
      activity: bmr * (multiplier - 1),
    ));
  }
}
