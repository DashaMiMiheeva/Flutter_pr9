import 'package:bloc/bloc.dart';

class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(state.copyWith(errorMessage: "Заполните все поля"));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
