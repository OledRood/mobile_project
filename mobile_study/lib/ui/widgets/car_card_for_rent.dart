import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class CarCardForRentWidget extends StatelessWidget {
  final String autoName;
  final String autoMark;
  final String price;
  final String pricePeriod;

  final String? image;

  const CarCardForRentWidget({
    super.key,
    required this.autoName,
    required this.autoMark,
    required this.price,
    required this.pricePeriod,

    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("Image in CarCardForRentWidget: $image");
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 342,
        maxWidth: 400, // можно растягиваться до 380
        minHeight: 184,
        maxHeight: 184, // фиксированная высота
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
                            text: '$price₽',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          TextSpan(
                            text: ' $pricePeriod',
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
                  ],
                ),
              ),
            ],
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
      width: 176,
      height: 136,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) => SizedBox(
        width: 176,
        height: 136,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (context, url, error) => Container(
        width: 176,
        height: 136,
        color: Colors.grey[300],
        child: Icon(Icons.error_outline, color: Colors.grey[600]),
      ),
    );
  }
}
