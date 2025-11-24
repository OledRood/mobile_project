import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/settings/add_car/add_car_di.dart';
import 'package:mobile_study/ui/widgets/image_picker_button.dart';

class AddCarPhotoScreen extends ConsumerWidget {
  const AddCarPhotoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(AddCarDi.addCarFlowProvider.notifier);
    final photos = ref.watch(
      AddCarDi.addCarFlowProvider.select((s) => s.photos),
    );
    final state = ref.watch(AddCarDi.addCarFlowProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Добавление фотографий")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2, // Занимает 2/5 экрана (примерно)
                child: _MainPhotoArea(
                  photoPath: photos.isNotEmpty ? photos.first : null,
                  onAdd: (file) {
                    if (file != null) notifier.addPhoto(file.path);
                  },
                  onRemove: () {
                    if (photos.isNotEmpty) notifier.removePhoto(photos.first);
                  },
                ),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 8),

              Expanded(
                flex: 3,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: (photos.isEmpty) ? 0 : (photos.length - 1) + 1,
                  itemBuilder: (context, index) {
                    if (index == (photos.length - 1)) {
                      return _AddButtonSmall(
                        onAdd: (file) {
                          if (file != null) notifier.addPhoto(file.path);
                        },
                      );
                    }
                    final path = photos[index + 1];
                    return _PhotoTile(
                      path: path,
                      onRemove: () => notifier.removePhoto(path),
                      makeMain: () => notifier.makeMainPhoto(path),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: FilledButton(
                  onPressed: state.isPhotosValid
                      ? () => notifier.submitCar()
                      : null,
                  child: const Text("Далее"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainPhotoArea extends StatelessWidget {
  final String? photoPath;
  final Function(File?) onAdd;
  final VoidCallback onRemove;

  const _MainPhotoArea({
    this.photoPath,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (photoPath == null) {
      return ImagePickerButton(
        providerId: 'main_photo',
        onChanged: onAdd,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_a_photo,
                  size: 50,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                const SizedBox(height: 8),
                Text(
                  "Добавить главное фото",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(File(photoPath!), fit: BoxFit.cover),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: onRemove,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              "Главное фото",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _AddButtonSmall extends StatelessWidget {
  final Function(File?) onAdd;
  const _AddButtonSmall({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ImagePickerButton(
      providerId: 'extra_photo',
      onChanged: onAdd,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: Icon(
          Icons.add,
          size: 30,
          color: Theme.of(context).colorScheme.outline.withAlpha(150),
        ),
      ),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  final String path;
  final VoidCallback onRemove;
  final VoidCallback makeMain;
  const _PhotoTile({
    required this.path,
    required this.onRemove,
    required this.makeMain,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(File(path), fit: BoxFit.cover),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: PopupMenuButton<String>(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black54, // Фон для контраста
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.outline.withAlpha(150),
                size: 18,
              ),
            ),
            onSelected: (value) {
              if (value == 'delete') onRemove();
              if (value == 'main') makeMain();
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'main',
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Text('Сделать главным'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Text('Удалить'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
