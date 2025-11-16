import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class CarCardForRentWidget extends StatelessWidget {
  final String autoName;
  final String autoMark;
  final String price;
  final String pricePeriod;

  final String image;

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
                child: Image.asset(image, width: 176, height: 136),
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
                        ).textTheme.bodyLarge, // Default style
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
