import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('HomePage'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
              icon: Assets.icons.dog.svg(width: 24), label: 'Discover'),
          NavigationDestination(
            icon: Assets.icons.chats.svg(width: 24),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Assets.icons.paw.svg(width: 24),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
