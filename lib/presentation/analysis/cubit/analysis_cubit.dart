import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pr9/data/model/user.dart';
import '../../../data/model/food.dart';
import 'package:flutter_pr9/data/model/activity.dart';

class AnalysisState {
  final double calories;
  final double proteins;
  final double fats;
  final double carbs;
  final double activity;

  const AnalysisState({
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.activity,
  });
}

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit() : super(const AnalysisState(calories: 0, proteins: 0, fats: 0, carbs: 0, activity: 0));

  void updateFromDiary(List<Food> foods, User user, List<UserActivity> activities) {
    final calories = foods.fold(0.0, (sum, f) => sum + f.calories);
    final proteins = foods.fold(0.0, (sum, f) => sum + f.proteins);
    final fats = foods.fold(0.0, (sum, f) => sum + f.fats);
    final carbs = foods.fold(0.0, (sum, f) => sum + f.carbs);
    final activity = activities.fold(0.0, (sum, a) => sum + a.calories);

    emit(AnalysisState(
      calories: calories,
      proteins: proteins,
      fats: fats,
      carbs: carbs,
      activity: activity,
    ));
  }
}
