import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/home/home_di.dart';
import 'package:mobile_study/features/home/models/home_model.dart';
import 'package:mobile_study/features/home/models/search_result_model.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';
import 'package:mobile_study/ui/widgets/car_card.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/search_listview.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightForListView = MediaQuery.sizeOf(context).height - 199;
    final state = ref.watch(HomeDi.homeViewModel);
    final vm = ref.read(HomeDi.homeViewModel.notifier);

    return Scaffold(
      body: Column(
        children: [
          _UpScreenPart(),
          Expanded(
            child: SizedBox(
              // height: heightForListView,
              child: SearchResultListWidget(
                items: state.searchResults,
                isLoading: state.isLoading,
                onRentPressed: vm.onRentButtonPressed,
                onDetailsPressed: vm.onDetailsButtonPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UpScreenPart extends ConsumerWidget {
  const _UpScreenPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(HomeDi.homeViewModel.notifier);
    return Container(
      width: double.infinity,
      height: 199,
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          SearchBar(
            controller: vm.searchController,
            elevation: WidgetStatePropertyAll(1),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            ),
            leading: CustomIconWidget(icon: Icons.search),
            hintText: "Введите марку автомобиля",
            onSubmitted: (_) => vm.onSearchTextSubmitted(),
          ),
          SizedBox(height: 32),
          Text(
            "Давайте найдем автомобиль",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
