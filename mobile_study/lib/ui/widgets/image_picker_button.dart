import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_study/core/image_picker/image_picker_notifier.dart';

class ImagePickerButton extends ConsumerWidget {
  final String providerId;
  final Widget child;
  final void Function(File?)? onChanged;

  const ImagePickerButton({
    required this.providerId,
    required this.child,
    this.onChanged,
    super.key,
  });

  Future<void> _showPicker(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(
                  'Галерея',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () async {
                  await ref
                      .read(imagePickerProvider(providerId).notifier)
                      .pick(ImageSource.gallery);
                  onChanged?.call(ref.read(imagePickerProvider(providerId)));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(
                  'Камера',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                onTap: () async {
                  await ref
                      .read(imagePickerProvider(providerId).notifier)
                      .pick(ImageSource.camera);
                  onChanged?.call(ref.read(imagePickerProvider(providerId)));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // слушаем, чтобы виджет реагировал на выбранный файл (если нужно показывать превью)
    ref.watch(imagePickerProvider(providerId));
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _showPicker(context, ref),
      child: child,
    );
  }
}
