import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class CarCardWidget extends StatelessWidget {
  final String autoName;
  final String autoMark;
  final String pricePerDay;
  final String transmission;
  final String fuel;
  final String? image;
  final VoidCallback onBorrowPressed;
  final VoidCallback onDetailsPressed;
  final bool isForRent;

  const CarCardWidget({
    super.key,
    required this.autoName,
    required this.autoMark,
    required this.pricePerDay,
    required this.transmission,
    required this.fuel,
    required this.onBorrowPressed,
    required this.onDetailsPressed,
    required this.image,
    this.isForRent = false,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 341,
          maxWidth: 380, // можно растягиваться до 380
          minHeight: 184,
          maxHeight: 248, // фиксированная высота
        ),

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface, // Цвет, как у вас
              width: 1, // Толщина линии
            ),
          ),

          child: Container(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: _ImageWidget(image: image),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 17),
                      Text(
                        autoName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        autoMark,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(
                            context,
                          ).textTheme.displaySmall, // Default style
                          children: <TextSpan>[
                            TextSpan(
                              text: '$pricePerDay₽',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextSpan(
                              text: ' в день',
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          SizedBox(
                            height: 18,
                            width: 18,
                            child: Image.asset(AppIcons.gearbox),
                          ),
                          const SizedBox(width: 1.5),
                          Text(transmission),
                          const SizedBox(width: 16),
                          SvgPicture.asset(
                            AppIcons.fuel,
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 1.5),
                          Text(fuel),
                        ],
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: _BottomButtons(
                    onBorrowPressed: onBorrowPressed,
                    onDetailsPressed: onDetailsPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Image.asset(AppImages.loader, width: 176, height: 136);
    }
    return CachedNetworkImage(
      imageUrl: image!,
      cacheKey: image,
      width: 176,
      height: 136,
      fit: BoxFit.fitWidth,
      fadeInDuration: Duration(milliseconds: 300),
      fadeOutDuration: Duration(milliseconds: 300),
      placeholder: (context, url) => SizedBox(
        width: 176,
        height: 136,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (context, url, error) {
        return Container(
          width: 176,
          height: 136,
          color: Colors.grey[300],
          child: Icon(Icons.error_outline, color: Colors.grey[600]),
        );
      },
    );
  }
}

class _BottomButtons extends StatelessWidget {
  final Function() onBorrowPressed;
  final Function() onDetailsPressed;
  const _BottomButtons({
    required this.onBorrowPressed,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 49,
          child: FilledButton(
            onPressed: onBorrowPressed,
            child: Text("Забронировать"),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 49,
            child: OutlinedButton(
              onPressed: onDetailsPressed,
              child: Text("Детали"),
            ),
          ),
        ),
      ],
    );
  }
}
