import 'package:bloc/bloc.dart';

class RegisterState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  RegisterState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  Future<void> register(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      emit(state.copyWith(errorMessage: "Заполните все поля"));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
