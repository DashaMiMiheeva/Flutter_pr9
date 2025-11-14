import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderSettings {
  final bool enabled;
  final DateTime breakfastTime;
  final DateTime lunchTime;
  final DateTime dinnerTime;

  ReminderSettings({
    required this.enabled,
    required this.breakfastTime,
    required this.lunchTime,
    required this.dinnerTime,
  });

  ReminderSettings copyWith({
    bool? enabled,
    DateTime? breakfastTime,
    DateTime? lunchTime,
    DateTime? dinnerTime,
  }) {
    return ReminderSettings(
      enabled: enabled ?? this.enabled,
      breakfastTime: breakfastTime ?? this.breakfastTime,
      lunchTime: lunchTime ?? this.lunchTime,
      dinnerTime: dinnerTime ?? this.dinnerTime,
    );
  }
}

class ReminderCubit extends Cubit<ReminderSettings> {
  ReminderCubit()
      : super(ReminderSettings(
    enabled: true,
    breakfastTime: DateTime(0,0,0,8,0),
    lunchTime: DateTime(0,0,0,13,0),
    dinnerTime: DateTime(0,0,0,19,0),
  ));

  void toggleEnabled(bool value) => emit(state.copyWith(enabled: value));
  void setBreakfastTime(DateTime time) => emit(state.copyWith(breakfastTime: time));
  void setLunchTime(DateTime time) => emit(state.copyWith(lunchTime: time));
  void setDinnerTime(DateTime time) => emit(state.copyWith(dinnerTime: time));
}
