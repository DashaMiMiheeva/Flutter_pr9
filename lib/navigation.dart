import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatelessWidget {
  final Widget child;
  const MainNavigation({required this.child, super.key});

  static const _pages = [
    '/diary',
    '/analysis',
    '/profile',
    '/count',
    '/activity'
  ];

  int _locationToIndex(String location) {
    final index = _pages.indexWhere((p) => location.startsWith(p));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location;
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) => context.go(_pages[i]),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: "Дневник"),
          NavigationDestination(icon: Icon(Icons.pie_chart), label: "Анализ"),
          NavigationDestination(icon: Icon(Icons.person), label: "Профиль"),
          NavigationDestination(icon: Icon(Icons.calculate), label: "Расчет"),
          NavigationDestination(icon: Icon(Icons.directions_run), label: "Активность"),
        ],
      ),
    );
  }
}
