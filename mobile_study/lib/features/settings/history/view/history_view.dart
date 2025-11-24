import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/models/car/car_history_model.dart';
import 'package:mobile_study/features/settings/history/history_di.dart';

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
      appBar: AppBar(
        title: const Text('Мои бронирования'),
        backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(10),
      ),
      body: Center(child: HistoryListWidget(items: historyList)),
    );
  }
}

class HistoryListWidget extends ConsumerWidget {
  final List<CarHistoryModel> items;
  const HistoryListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(HistoryDi.historyViewModel.notifier);
    if (items.isEmpty) {
      return const Center(child: Text('У вас нет бронирований.'));
    }
    return RefreshIndicator(
      onRefresh: () async {
        await viewModel.getHistoryList();
      },
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(viewModel.getDateString(index)),
            onTap: () => viewModel.operDetails(items[index].rentId),
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 0.5),
      ),
    );
  }
}
