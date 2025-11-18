class User {
  final String name;
  final String email;
  final int height;
  final int weight;
  final int age;
  final int calories;
  final int protein;
  final int fat;
  final int carbs;
  final int activity;

  User({
    required this.name,
    required this.email,
    this.height = 0,
    this.weight = 0,
    this.age = 0,
    this.calories = 0,
    this.protein = 0,
    this.fat = 0,
    this.carbs = 0,
    this.activity = 0,
  });

  User copyWith({
    String? name,
    String? email,
    int? height,
    int? weight,
    int? age,
    int? calories,
    int? protein,
    int? fat,
    int? carbs,
    int? activity,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      activity: activity ?? this.activity,
    );
  }
}
