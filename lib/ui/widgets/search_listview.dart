import 'package:flutter/material.dart';
import 'package:mobile_study/features/home/models/search_result_model.dart';
import 'package:mobile_study/ui/widgets/car_card.dart';

class SearchResultListWidget extends StatelessWidget {
  final List<SearchResultModel>? items;
  final bool isLoading;
  final void Function(String id)? onBorrowPressed;
  final void Function(String id)? onDetailsPressed;

  const SearchResultListWidget({
    super.key,
    required this.items,
    this.isLoading = false,
    this.onBorrowPressed,
    this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return Center(child: Text("Ничего не найдено"));
    }
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
      itemCount: items!.length,
      itemBuilder: (context, index) {
        final item = items![index];
        return CarCardWidget(
          autoName: item.autoName,
          autoMark: item.autoMark,
          price: item.price,
          pricePeriod: item.pricePeriod,
          transmission: item.transmission,
          fuel: item.fuel,
          onBorrowPressed: () => onBorrowPressed?.call(item.id),
          onDetailsPressed: () => onDetailsPressed?.call(item.id),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }
}
