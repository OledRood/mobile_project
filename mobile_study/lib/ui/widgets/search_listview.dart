import 'package:flutter/material.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

import 'package:mobile_study/ui/widgets/car_card.dart';

class SearchResultListWidget extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final List<CarCardModel>? items;
  final bool isLoading;
  final bool isShowRefresh;
  final void Function(String id)? onRentPressed;
  final void Function(String id)? onDetailsPressed;

  const SearchResultListWidget({
    super.key,
    required this.items,
    this.isLoading = false,
    this.onRentPressed,
    this.onDetailsPressed,
    this.isShowRefresh = false,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ничего не найдено"),
            SizedBox(height: 14),
            if (isShowRefresh == true && onRefresh != null)
              FilledButton(
                onPressed: () {
                  onRefresh;
                },
                child: Text("Обновить"),
              ),
          ],
        ),
      );
    }
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () async {
        if (onRefresh != null) await onRefresh!();
        // Add your refresh logic here
      },
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
        itemCount: items!.length,
        itemBuilder: (context, index) {
          final item = items![index];
          return CarCardWidget(
            autoName: item.name,
            autoMark: item.mark,
            pricePerDay: item.pricePerDay,
            transmission: item.transmission,
            fuel: item.fuel,
            onBorrowPressed: () => onRentPressed?.call(item.id),
            onDetailsPressed: () => onDetailsPressed?.call(item.id),
            image: item.image,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }
}
