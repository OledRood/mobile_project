import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabelBuilder;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemLabelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: colorScheme.outline.withOpacity(0.5),
        width: 1,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          initialValue: value,
          hint: Text(label),
          isExpanded: true,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
          borderRadius: BorderRadius.circular(12),
          dropdownColor: colorScheme.surface,

          decoration: InputDecoration(
            labelStyle: textTheme.bodyMedium?.copyWith(
              color: colorScheme.outlineVariant,
            ),
            floatingLabelStyle: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),

            border: border,

            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: BorderSide(color: colorScheme.primary, width: 1),
            ),
          ),

          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,

          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemLabelBuilder(item),
                style: textTheme.bodyLarge, // Стиль текста в списке
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,

          // Убираем подчеркивание (для некоторых версий Flutter)
          // focusColor: Colors.transparent,
        ),
      ],
    );
  }
}
