import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/favorites/favorites_di.dart';
import 'package:mobile_study/features/home/home_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/search_listview.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(FavoritesDi.favoritesViewModel);
    final vm = ref.read(FavoritesDi.favoritesViewModel.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Избранное")),
      body: SearchResultListWidget(
        items: state.favoritesList,
        isLoading: state.isLoading,
        onRentPressed: vm.onRentButtonPressed,
        onDetailsPressed: vm.onDetailsButtonPressed,
      ),
    );
  }
}
