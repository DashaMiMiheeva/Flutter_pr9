import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/food.dart';
import '../../data/repository/food_repository.dart';
import '../../locator.dart';
import '../common/meal_type.dart';
import 'cubit/add_food_cubit.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final _nameController = TextEditingController();
  final _calController = TextEditingController();
  final _pController = TextEditingController();
  final _fController = TextEditingController();
  final _cController = TextEditingController();

  String meal = MealType.types.first;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddFoodCubit(locator.get<FoodRepository>()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Добавить продукт")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Название")),
              TextField(controller: _calController, decoration: const InputDecoration(labelText: "Ккал"), keyboardType: TextInputType.number),
              TextField(controller: _pController, decoration: const InputDecoration(labelText: "Белки"), keyboardType: TextInputType.number),
              TextField(controller: _fController, decoration: const InputDecoration(labelText: "Жиры"), keyboardType: TextInputType.number),
              TextField(controller: _cController, decoration: const InputDecoration(labelText: "Углеводы"), keyboardType: TextInputType.number),
              const SizedBox(height: 12),
              DropdownButton(
                value: meal,
                items: MealType.types.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                onChanged: (v) => setState(() => meal = v!),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  final food = Food(
                    id: DateTime.now().toString(),
                    name: _nameController.text,
                    calories: int.tryParse(_calController.text) ?? 0,
                    proteins: double.tryParse(_pController.text) ?? 0,
                    fats: double.tryParse(_fController.text) ?? 0,
                    carbs: double.tryParse(_cController.text) ?? 0,
                    mealType: meal,
                    imageUrl: MealType.images[meal]!,
                  );
                  context.read<AddFoodCubit>().add(food);
                  Navigator.pop(context);
                },
                child: const Text("Сохранить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
