import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/home/home_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/search_listview.dart';

class SearchResultScreen extends ConsumerWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeDi.homeViewModel);
    final vm = ref.read(HomeDi.homeViewModel.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Результаты поиска"),
        leading: IconButton(
          onPressed: () {},
          icon: CustomIconWidget(iconPath: AppIcons.leftChevron),
        ),
      ),
      body: SearchResultListWidget(
        items: state.searchResults,
        isLoading: state.isLoading,
        onBorrowPressed: vm.onBorrowButtonPressed,
        onDetailsPressed: vm.onDetailButtonPressed,
      ),
    );
  }
}
