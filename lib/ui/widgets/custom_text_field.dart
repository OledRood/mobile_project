import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/ui/theme/models/app_colors.dart';

import '../theme/models/app_images.dart';

class CustomTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? icon;
  final VoidCallback? onIconPressed;
  final int? maxLines;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? prefIcon;
  final void Function(String)? onSubmitted;
  final bool isLoading;
  final String? svgIcon;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.label,
    this.inputFormatters,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.icon,
    this.maxLines = 1,
    this.onIconPressed,
    this.prefIcon,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    required this.isLoading,
    this.svgIcon,
    this.errorText,
  });

  static const _textColor = AppColors.textFieldText;
  static const _borderColor = AppColors.textFieldBorder;
  static const _errorColor = AppColors.textFieldError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          validator: validator,
          enabled: !isLoading,
          onChanged: onChanged,
          focusNode: focusNode,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          onFieldSubmitted: onSubmitted,
          style: Theme.of(context).textTheme.bodySmall,

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _borderColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _borderColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _errorColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _errorColor, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            prefixIcon: prefIcon == null
                ? null
                : Padding(
              padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                      onTap: onIconPressed,
                      child: SvgPicture.asset(
                        prefIcon!,
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          AppColors.textFieldIcon,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20, // уменьшить до нужного значения
              minHeight: 20,
            ),
            suffixIcon: svgIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: onIconPressed,
                      child: SvgPicture.asset(
                        svgIcon!,
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: AppColors.textFieldIcon,
                      ),
                    ),
                  ),

            errorStyle: const TextStyle(
              color: _errorColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
