// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'settings_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mobile_study/features/profile/profile_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(ProfileDi.profileViewModel.notifier);
    final state = ref.watch(ProfileDi.profileViewModel);

    final profileItems = state.profileItems;

    if (profileItems == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [],
        leading: SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _AccountPhotoIcons(onTap: () {}),
            SizedBox(height: 30),
            ...List.generate(profileItems.length, (index) {
              if (profileItems[index] == null) {
                return Divider(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  thickness: 0.5,
                );
              }
              final subtitle = profileItems[index]!.subtitle;
              return ListTile(
                title: Text(profileItems[index]!.title),
                subtitle: Text(subtitle),
                onTap: () {
                  // Обработка нажатия на элемент настроек
                },
              );
            }),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {},
                child: Text("Выйти из профиля"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountPhotoIcons extends ConsumerWidget {
  final VoidCallback onTap;

  const _AccountPhotoIcons({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ProfileDi.profileViewModel);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            state.accountPhoto != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 96,
                      width: 96,
                      child: Image.asset(
                        state.accountPhoto!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : SvgPicture.asset(AppIcons.accountAdd, width: 96, height: 96),
            Positioned(
              bottom: 7,
              right: 7,
              child: SvgPicture.asset(
                AppIcons.addCircle,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          state.userName ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(state.dateOfCreation ?? ""),
      ],
    );
  }
}
