import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../profile/user_cubit.dart';
import '../welcome/cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Регистрация")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.isSuccess) {
              context.go('/diary');
            }
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),);}
          },
          builder: (context, state) {
            return Column(
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: "Имя"),
                ),
                TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Пароль"), obscureText: true,
                ),
                const SizedBox(height: 20),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final email = emailController.text;
                    final password = passwordController.text;

                    context.read<RegisterCubit>().register(name, email, password).then((_) {
                      if (context.read<RegisterCubit>().state.isSuccess) {
                        context.read<UserCubit>().updateName(name);
                        context.go('/diary');}});
                  },
                  child: const Text("Зарегистрироваться"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
