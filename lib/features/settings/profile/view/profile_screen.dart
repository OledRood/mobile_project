// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'settings_view_model.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mobile_study/features/settings/profile/profile_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/image_picker_button.dart';

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
                  height: 1.0,
                );
              }
              final subtitle = profileItems[index]!.subtitle;
              return ListTile(
                title: Text(profileItems[index]!.title),
                subtitle: Text(subtitle),
                onTap: profileItems[index]!.onTap,
              );
            }),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  viewModel.signOut();
                },
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
    final vm = ref.watch(ProfileDi.profileViewModel.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImagePickerButton(
          providerId: 'account_photo',
          onChanged: vm.onReplacePhotoTap,
          child: Stack(
            children: [
              state.user?.avatar != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 96,
                        width: 96,
                        child: Image.file(
                          File(state.user!.avatar!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SvgPicture.asset(
                      AppIcons.accountAdd,
                      width: 96,
                      height: 96,
                    ),
              Positioned(
                bottom: 7,
                right: 7,
                child: CustomIconWidget(
                  icon: Icons.add_circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
        Text(
          state.user?.name ?? "Имя пользователя",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(state.user?.email ?? "Почта"),
      ],
    );
  }
}
