import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconWidget extends StatelessWidget {
  final Color? color;
  final dynamic icon;
  final double size;

  const CustomIconWidget({
    super.key,
    this.color,
    this.size = 24,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final decodeIcon = switch (icon) {
      String s => s,
      IconData d => d,
      _ => icon.toString(),
    };

    if (decodeIcon is IconData) {
      return Icon(
        decodeIcon,
        size: size,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      );
    }

    final isSvgIcon = _checkIsSvg(decodeIcon as String);

    switch (isSvgIcon) {
      case true:
        return SvgPicture.asset(
          decodeIcon,
          width: size,
          height: size,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
        );
      case false:
        return Image.asset(
          decodeIcon,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        );
    }
  }
}

bool _checkIsSvg(String iconPath) {
  return iconPath.endsWith('.svg');
}
