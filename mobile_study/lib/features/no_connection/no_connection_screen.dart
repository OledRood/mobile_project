import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/no_connection/no_connection_di.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class NoConnectionScreen extends ConsumerWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(NoConnectionDi.noConnectionViewModel.notifier);
    final state = ref.watch(NoConnectionDi.noConnectionViewModel);

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                CenterWidget(),
                const Spacer(),
                SizedBox(
                  width: width - (24 * 2),
                  child: ElevatedButton(
                    onPressed: () => vm.onPressRetry(),
                    child: const Text('Повторить попытку'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.noConnection, width: 96, height: 96),
        const SizedBox(height: 32),
        Text(
          "Нет подключения\n к интернету",
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Text(
          "Проверьте подключение и повторите попытку",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
