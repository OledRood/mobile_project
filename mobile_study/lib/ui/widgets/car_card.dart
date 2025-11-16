import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class CarCardWidget extends StatelessWidget {
  final String autoName;
  final String autoMark;
  final String price;
  final String pricePeriod;
  final String transmission;
  final String fuel;
  final String image;
  final VoidCallback onBorrowPressed;
  final VoidCallback onDetailsPressed;
  final bool isForRent;

  const CarCardWidget({
    super.key,
    required this.autoName,
    required this.autoMark,
    required this.price,
    required this.pricePeriod,
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

class _BottomButtons extends StatelessWidget {
  final Function() onBorrowPressed;
  final Function() onDetailsPressed;
  const _BottomButtons({
    super.key,
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
