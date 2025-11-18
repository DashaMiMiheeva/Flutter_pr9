import '../model/food.dart';

class FoodRepository {
  final List<Food> _foods = [];

  List<Food> get foods => List.unmodifiable(_foods);

  void add(Food food) {
    _foods.insert(0, food);
  }

  void delete(String id) {
    _foods.removeWhere((f) => f.id == id);
  }
}
