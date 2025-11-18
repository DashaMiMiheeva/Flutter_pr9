import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pr9/presentation/count/calculator_screen.dart';
import 'package:flutter_pr9/presentation/analysis/cubit/analysis_cubit.dart';
import 'package:flutter_pr9/presentation/count/cubit/calculator_cubit.dart';
import 'package:flutter_pr9/presentation/reminder/cubit/reminder_cubit.dart';
import 'package:flutter_pr9/presentation/reminder/reminder_screen.dart';
import 'package:flutter_pr9/presentation/welcome/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'locator.dart';
import 'data/repository/food_repository.dart';
import 'navigation.dart';
import 'presentation/welcome/welcome_screen.dart';
import 'presentation/dairy/diary_screen.dart';
import 'presentation/dairy/cubit/diary_cubit.dart';
import 'presentation/profile/profile_screen.dart';
import 'presentation/profile/user_cubit.dart';
import 'presentation/analysis/analysis_screen.dart';


void main() {
  setupLocator();

  runApp(
    BlocProvider(
      create: (_) => UserCubit(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const WelcomeScreen()),
        GoRoute(path: '/register', builder: (_, __) => RegisterScreen()),

        ShellRoute(
          builder: (context, state, child) {
            return MainNavigation(child: child);
          },
          routes: [
            GoRoute(path: '/diary', builder: (_, __) => const DiaryScreen()),
            GoRoute(
              path: '/analysis',
              builder: (_, __) => BlocProvider(
                create: (_) => AnalysisCubit(),
                child: const AnalysisScreen(),
              ),
            ),
            GoRoute(path: '/profile', builder: (_, __) => ProfileScreen()),
            GoRoute(
              path: '/count',
              builder: (_, __) => BlocProvider(
                create: (_) => CalculatorCubit(),
                child: CalculatorScreen(),
              ),
            ),
            GoRoute(
              path: '/reminders', builder: (_, __) => const ReminderScreen()),
          ],
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<UserCubit>()),
        BlocProvider(create: (_) => DiaryCubit(locator.get<FoodRepository>())),
        BlocProvider(create: (_) => ReminderCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        title: "Дневник питания",
        theme: ThemeData(
          primarySwatch: Colors.pink,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.pink,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}

