import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_study/core/navigation/app_routes.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';

class BottomNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationShell({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      // При повторном нажатии на текущую вкладку возвращаемся к начальному маршруту
      // При переключении на другую вкладку открываем последний маршрут
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell, // Вместо child
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex, // Индекс из navigationShell
        onTap: _onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            activeIcon: Icon(
              Icons.home_sharp,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outline,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            activeIcon: Icon(
              Icons.bookmark,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Избранное',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            activeIcon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
