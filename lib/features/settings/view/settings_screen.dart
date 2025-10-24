// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'settings_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/settings/settings_di.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(SettingsDi.settingsViewModel.notifier);
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final state = ref.watch(SettingsDi.settingsViewModel);
    final settingsItems = state.settingsItems;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [],
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileListTile(),
            ...List.generate(settingsItems.length, (index) {
              if (settingsItems[index] == null) {
                return Divider(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  thickness: 0.5,
                );
              }
              final isSvg = settingsItems[index]?.isSvg ?? true;
              final iconPath = settingsItems[index]!.iconPath;
              return ListTile(
                leading: CustomIconWidget(iconPath: iconPath, isSvg: isSvg),
                title: Text(settingsItems[index]!.title),
                trailing: RotatedBox(
                  quarterTurns: 2, // 180 градусов
                  child: CustomIconWidget(iconPath: AppIcons.leftChevron),
                ),
                onTap: () {
                  settingsItems[index]!.onTap();
                  // Обработка нажатия на элемент настроек
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends ConsumerWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(SettingsDi.settingsViewModel.notifier);
    final state = ref.watch(SettingsDi.settingsViewModel);
    return ListTile(
      leading: Container(
        height: 67,
        width: 67,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(20),
        ),
        child: CustomIconWidget(iconPath: AppIcons.user),
      ),
      title: const Text('Профиль'),
      subtitle: const Text("ivan@mtuci.ru"),
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onTap: () => vm.onProfileTap(),
    );
  }
}
