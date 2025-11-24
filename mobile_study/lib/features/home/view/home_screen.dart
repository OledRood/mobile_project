import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/home/home_di.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/search_listview.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeDi.homeViewModel);
    final vm = ref.watch(HomeDi.homeViewModel.notifier);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _UpScreenPart(),
              Expanded(
                child: SizedBox(
                  // height: heightForListView,
                  child: SearchResultListWidget(
                    onRefresh: vm.onRefresh,
                    items: state.recommendations,
                    isShowRefresh: true,
                    isLoading: state.isLoading,
                    onRentPressed: vm.onRentButtonPressed,
                    onDetailsPressed: vm.onDetailsButtonPressed,
                  ),
                ),
              ),
            ],
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
    final state = ref.watch(HomeDi.homeViewModel);
    return Container(
      width: double.infinity,
      height: 199,
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 70),
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  controller: vm.searchController,
                  elevation: WidgetStatePropertyAll(1),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  leading: CustomIconWidget(icon: Icons.search),
                  hintText: "Введите марку автомобиля",
                  onSubmitted: (_) {
                    vm.onSearchTextSubmitted();
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (_) {
                    vm.onSearchTextChanged();
                  },
                ),
              ),
              _SearchButtonWidget(
                isShow: state.isShowSearchButton,
                onPressed: () {
                  vm.onSearchTextSubmitted();
                },
              ),
            ],
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

class _SearchButtonWidget extends StatefulWidget {
  final bool isShow;
  final VoidCallback onPressed;
  const _SearchButtonWidget({
    super.key,
    required this.isShow,
    required this.onPressed,
  });

  @override
  State<_SearchButtonWidget> createState() => _SearchButtonWidgetState();
}

class _SearchButtonWidgetState extends State<_SearchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 100),
      opacity: widget.isShow ? 1 : 0,
      child: AnimatedSize(
        duration: Duration(milliseconds: 100),

        child: Padding(
          padding: EdgeInsets.only(left: 8),
          child: SizedBox(
            height: 56,
            width: widget.isShow ? 28 : 0,
            child: IconButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                padding: EdgeInsets.symmetric(horizontal: (28 - 24) / 2),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              icon: Icon(Icons.next_plan_outlined, size: 24),
            ),
          ),
        ),
      ),
    );
  }
}
