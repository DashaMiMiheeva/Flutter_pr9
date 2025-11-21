import 'package:bloc/bloc.dart';
import '../../data/model/user.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User(name: '', email: ''));

  void updateName(String name) => emit(state.copyWith(name: name));
  void updateEmail(String email) => emit(state.copyWith(email: email));
  void updateHeight(int height) => emit(state.copyWith(height: height));
  void updateWeight(int weight) => emit(state.copyWith(weight: weight));
  void updateAge(int age) => emit(state.copyWith(age: age));
  void updateCalories(int calories) => emit(state.copyWith(calories: calories));
  void updateProtein(int protein) => emit(state.copyWith(protein: protein));
  void updateFat(int fat) => emit(state.copyWith(fat: fat));
  void updateCarbs(int carbs) => emit(state.copyWith(carbs: carbs));
  void updateActivity(int activity) => emit(state.copyWith(activity: activity));
}


