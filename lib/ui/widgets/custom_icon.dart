import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconWidget extends StatelessWidget {
  final Color? color;
  final bool? isSvg;
  final String iconPath;
  final double size;

  const CustomIconWidget({
    super.key,
    this.color,
    this.isSvg,
    this.size = 24,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final isSvgIcon = isSvg ?? _checkIsSvg(iconPath);
    switch (isSvgIcon) {
      case true:
        return SvgPicture.asset(
          iconPath,
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
          iconPath,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        );
    }
  }
}

bool _checkIsSvg(String iconPath) {
  return iconPath.endsWith('.svg');
}
