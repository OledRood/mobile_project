import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Возвращает выбранный файл или null
  Future<File?> pickImage(ImageSource source, {int imageQuality = 90}) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
      );
      if (picked == null) return null;
      return File(picked.path);
    } catch (e) {
      // можно логировать/обрабатывать ошибки централизованно
      return null;
    }
  }
}
