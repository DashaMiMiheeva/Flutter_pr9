import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatefulWidget {
  final Widget child;
  const MainNavigation({required this.child, super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;

  final _pages = ['/diary', '/analysis', '/profile', '/count', '/reminders'];

  void _onTap(int i) {
    setState(() => _index = i);
    context.go(_pages[i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white54,
        selectedIndex: _index,
        onDestinationSelected: _onTap,
        indicatorColor: Colors.white24,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: "Дневник"),
          NavigationDestination(icon: Icon(Icons.pie_chart), label: "Анализ"),
          NavigationDestination(icon: Icon(Icons.person), label: "Профиль"),
          NavigationDestination(icon: Icon(Icons.calculate), label: "Расчет"),
          NavigationDestination(icon: Icon(Icons.notifications), label: "Напоминание"),
        ],
      ),
    );
  }
}
