import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/food.dart';
import '../../data/model/user.dart';
import '../profile/user_cubit.dart';
import '../activity/cubit/activity_cubit.dart';
import '../dairy/cubit/diary_cubit.dart';
import 'cubit/analysis_cubit.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  Widget _circle(String title, double current, double max) {
    final progress = (max == 0 ? 0.0 : (current / max).clamp(0.0, 1.0));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
              ),
              Text(
                "${current.toInt()} / ${max.toInt()}",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = AnalysisCubit();
        final diary = context.read<DiaryCubit>().state;
        final user = context.read<UserCubit>().state;
        final activities = context.read<ActivityCubit>().state.activities;
        cubit.updateFromDiary(diary, user, activities);
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Анализ питания")),
        body: Center(
          child: BlocBuilder<AnalysisCubit, AnalysisState>(
            builder: (context, analysis) {
              final user = context.read<UserCubit>().state;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _circle("Ккал", analysis.calories, user.calories.toDouble()),
                      _circle("Белки", analysis.proteins, user.protein.toDouble()),
                      _circle("Жиры", analysis.fats, user.fat.toDouble()),
                      _circle("Углеводы", analysis.carbs, user.carbs.toDouble()),
                      _circle("Активность", analysis.activity, user.activity.toDouble()),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
