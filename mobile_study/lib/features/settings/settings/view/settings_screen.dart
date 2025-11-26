// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'settings_view_model.dart';

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/settings/settings/settings_di.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(SettingsDi.settingsViewModel.notifier);
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
              return ListTile(
                leading: CustomIconWidget(icon: settingsItems[index]?.icon),
                title: Text(settingsItems[index]!.title),
                trailing: CustomIconWidget(icon: Icons.chevron_right),
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
      leading: _ProfileListTileLeading(),
      title: Text(state.user?.name ?? "Профиль"),
      subtitle: Text(state.user?.email ?? "почта"),
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onTap: () => vm.onProfileTap(),
    );
  }
}

class _ProfileListTileLeading extends ConsumerWidget {
  const _ProfileListTileLeading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(SettingsDi.settingsViewModel);
    final image = state.user?.fullAvatarUrl;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      width: 69,
      height: 69,

      child: CachedNetworkImage(
        imageUrl: state.user!.fullAvatarUrl,
        // Что показывать, пока грузится
        placeholder: (context, url) => const CircularProgressIndicator(),
        // Что показывать, если ссылка битая или нет инета
        errorWidget: (context, url, error) => Icon(
          Icons.person_outline,
          color: Theme.of(context).colorScheme.onSurface,
        ),

        // Если нужно вписать в круг (например, для аватарки):
        imageBuilder: (context, imageProvider) => Container(
          width: 69.0,
          height: 69.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
