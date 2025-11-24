import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/car_details/car_details_di.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class CarDetailsScreen extends ConsumerWidget {
  final String carId;
  const CarDetailsScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(
      CarDetailsDi.carDetailsViewModelProvider(carId).notifier,
    );
    final state = ref.watch(CarDetailsDi.carDetailsViewModelProvider(carId));
    final textTheme = Theme.of(context).textTheme;
    final isFavorite = state.carDetails?.isFavorite ?? false;

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: Text('Детали')),
        body: Center(child: Text(state.error!)),
      );
    }

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Детали')),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.addToFavorite();
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: _BottomButtonContainer(
              pricePerDay: state.carDetails?.pricePerDay ?? "",
              onPressedRent: () {
                viewModel.onTapRentButton();
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageWidget(image: state.carDetails?.imageUrlDetail),
              const SizedBox(height: 8),
              _LeftPaddingWidget(
                child: Text(
                  state.carDetails?.name ?? "",
                  style: textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 8),
              _DividerWithPadding(),
              const SizedBox(height: 8),

              _LeftPaddingWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Адрес нахождения:", style: textTheme.displaySmall),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Icon(Icons.location_on_outlined, size: 18),
                        SizedBox(width: 4),
                        Text(
                          state.carDetails?.location ?? "",
                          style: textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              _DividerWithPadding(),
              const SizedBox(height: 8),

              _LeftPaddingWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Описание", style: textTheme.headlineSmall),
                    const SizedBox(height: 8),

                    Text(
                      state.carDetails?.description ?? "",
                      style: textTheme.displaySmall?.copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    debugPrint("Image URL: $image");
    if (image == null) {
      return Image.asset(AppImages.loader, width: double.infinity, height: 260);
    }
    return CachedNetworkImage(
      imageUrl: image!,
      cacheKey: image,
      height: 260,
      width: double.infinity,
      fadeInDuration: Duration(milliseconds: 300),
      fadeOutDuration: Duration(milliseconds: 300),
      fit: BoxFit.fitWidth,

      placeholder: (context, url) => SizedBox(
        height: 260,
        width: double.infinity,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (context, url, error) {
        return Container(
          width: double.infinity,
          height: 260,
          color: Colors.grey[300],
          child: Icon(Icons.error_outline, color: Colors.grey[600]),
        );
      },
    );
  }
}

class _DividerWithPadding extends StatelessWidget {
  const _DividerWithPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(right: 48), child: Divider());
  }
}

class _LeftPaddingWidget extends StatelessWidget {
  final Widget child;
  const _LeftPaddingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 24), child: child);
  }
}

class _BottomButtonContainer extends StatelessWidget {
  final String pricePerDay;
  final VoidCallback onPressedRent;
  const _BottomButtonContainer({
    super.key,
    required this.pricePerDay,
    required this.onPressedRent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Color(0x0D101828), // rgba(16, 24, 40, 0.05)
            offset: Offset(0, -2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            "$pricePerDay₽/день",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Spacer(),
          FilledButton(onPressed: onPressedRent, child: Text("Забронировать")),
        ],
      ),
    );
  }
}
