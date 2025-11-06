import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_study/core/image_picker/image_picker_provider.dart';
import 'package:mobile_study/core/image_picker/image_picker_service.dart';

class ImagePickerNotifier extends StateNotifier<File?> {
  final ImagePickerService _service;
  ImagePickerNotifier(this._service) : super(null);

  Future<void> pick(ImageSource source) async {
    final file = await _service.pickImage(source);
    if (file != null) state = file;
  }

  void setFile(File file) => state = file;
  void clear() => state = null;
}

final imagePickerProvider =
    StateNotifierProvider.family<ImagePickerNotifier, File?, String>(
      (ref, id) => ImagePickerNotifier(ref.read(imagePickerServiceProvider)),
    );
