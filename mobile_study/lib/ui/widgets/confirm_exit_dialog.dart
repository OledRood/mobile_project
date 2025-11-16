import 'package:flutter/material.dart';

class ConfirmExitDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;

  const ConfirmExitDialog({
    super.key,
    this.title = 'Отменить регистрацию?',
    this.message = 'Все введенные данные будут потеряны.',
    this.confirmText = 'Выйти',
    this.cancelText = 'Отмена',
  });

  /// Показывает диалог и возвращает результат
  ///
  /// Возвращает:
  /// - `true` если пользователь подтвердил выход
  /// - `false` если пользователь отменил или закрыл диалог
  static Future<bool> show(
    BuildContext context, {
    String? title,
    String? message,
    String? confirmText,
    String? cancelText,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmExitDialog(
        title: title ?? 'Отменить регистрацию?',
        message: message ?? 'Все введенные данные будут потеряны. Продолжить?',
        confirmText: confirmText ?? 'Продолжить',
        cancelText: cancelText ?? 'Отмена',
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    );
  }
}
