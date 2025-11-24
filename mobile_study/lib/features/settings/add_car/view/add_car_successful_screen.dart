import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/settings/add_car/add_car_di.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class AddCarSuccessfulScreen extends ConsumerWidget {
  const AddCarSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _notifier = ref.read(AddCarDi.addCarFlowProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            // const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,

              // height: 300,
              child: Image.asset(
                AppImages.createCarSuccessfulImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            // const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ваш автомобиль добавлен",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Поздравляем! Ваш автомобиль одобрен",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: SizedBox(
                height: 50,
                width: 342,
                child: FilledButton(
                  onPressed: () => _notifier.goToHome(),
                  child: Text("На главную"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
