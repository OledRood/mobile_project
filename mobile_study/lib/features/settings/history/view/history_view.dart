import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/models/car/car_rent_data.dart';
import 'package:mobile_study/features/settings/history/history_di.dart';
import 'package:mobile_study/ui/widgets/search_listview.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HistoryDi.historyViewModel);
    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Мои бронирования')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (state.errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Мои бронирования')),
        body: Center(child: Text(state.errorMessage!)),
      );
    }
    final historyList = state.historyList ?? [];
    return Scaffold(
      appBar: AppBar(title: const Text('Мои бронирования')),
      body: Center(child: HistoryListWidget(items: historyList)),
    );
  }
}

class HistoryListWidget extends ConsumerWidget {
  final List<CarRentData> items;
  const HistoryListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(HistoryDi.historyViewModel.notifier);
    if (items.isEmpty) {
      return const Center(child: Text('У вас нет бронирований.'));
    }
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.autoName),
          subtitle: Text("начало аренды: ${item.startRentDate}"),
          onTap: () => viewModel.operDetails(items[index].id),
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 0.5),
    );
  }
}
