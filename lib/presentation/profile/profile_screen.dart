import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/user.dart';
import '../profile/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController fatController = TextEditingController();
  final TextEditingController carbsController = TextEditingController();
  final TextEditingController activityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Профиль")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<UserCubit, User>(
          builder: (context, user) {
            if (heightController.text.isEmpty && user.height > 0) heightController.text = user.height.toString();
            if (weightController.text.isEmpty && user.weight > 0) weightController.text = user.weight.toString();
            if (caloriesController.text.isEmpty && user.calories > 0) caloriesController.text = user.calories.toString();
            if (proteinController.text.isEmpty && user.protein > 0) proteinController.text = user.protein.toString();
            if (fatController.text.isEmpty && user.fat > 0) fatController.text = user.fat.toString();
            if (carbsController.text.isEmpty && user.carbs > 0) carbsController.text = user.carbs.toString();
            if (activityController.text.isEmpty && user.activity > 0) activityController.text = user.activity.toString();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Привет, ${user.name}!", style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Рост (см)"),
                    onChanged: (value) => userCubit.updateHeight(int.tryParse(value) ?? 0),
                  ),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Вес (кг)"),
                    onChanged: (value) => userCubit.updateWeight(int.tryParse(value) ?? 0),
                  ),
                  TextField(
                    controller: caloriesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Норма ккал"),
                    onChanged: (value) => userCubit.updateCalories(int.tryParse(value) ?? 0),
                  ),
                  TextField(
                    controller: proteinController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Белки (г)"),
                    onChanged: (value) => userCubit.updateProtein(int.tryParse(value) ?? 0),
                  ),
                  TextField(
                    controller: fatController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Жиры (г)"),
                    onChanged: (value) => userCubit.updateFat(int.tryParse(value) ?? 0),
                  ),
                  TextField(
                    controller: carbsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Углеводы (г)"),
                    onChanged: (value) => userCubit.updateCarbs(int.tryParse(value) ?? 0),
                  ),
                  TextField(
                    controller: activityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Норма активности (ккал)"),
                    onChanged: (value) => userCubit.updateActivity(int.tryParse(value) ?? 0),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Данные сохранены!")),
                      );
                    },
                    child: const Text("Сохранить"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
