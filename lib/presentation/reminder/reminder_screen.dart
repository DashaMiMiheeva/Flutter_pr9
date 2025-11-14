import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/reminder_cubit.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  Future<void> _pickTime(BuildContext context, DateTime initialTime, void Function(DateTime) onPicked) async {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initialTime.hour, minute: initialTime.minute),
    );
    if (timeOfDay != null) {
      onPicked(DateTime(0,0,0,timeOfDay.hour, timeOfDay.minute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReminderCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Настройки напоминаний")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ReminderCubit, ReminderSettings>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: const Text("Включить напоминания"),
                    value: state.enabled,
                    onChanged: (v) => context.read<ReminderCubit>().toggleEnabled(v),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: const Text("Завтрак"),
                    trailing: Text("${state.breakfastTime.hour.toString().padLeft(2,'0')}:${state.breakfastTime.minute.toString().padLeft(2,'0')}"),
                    onTap: () => _pickTime(context, state.breakfastTime, context.read<ReminderCubit>().setBreakfastTime),
                  ),
                  ListTile(
                    title: const Text("Обед"),
                    trailing: Text("${state.lunchTime.hour.toString().padLeft(2,'0')}:${state.lunchTime.minute.toString().padLeft(2,'0')}"),
                    onTap: () => _pickTime(context, state.lunchTime, context.read<ReminderCubit>().setLunchTime),
                  ),
                  ListTile(
                    title: const Text("Ужин"),
                    trailing: Text("${state.dinnerTime.hour.toString().padLeft(2,'0')}:${state.dinnerTime.minute.toString().padLeft(2,'0')}"),
                    onTap: () => _pickTime(context, state.dinnerTime, context.read<ReminderCubit>().setDinnerTime),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
