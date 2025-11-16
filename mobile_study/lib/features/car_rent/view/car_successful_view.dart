import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/features/car_rent/car_rent_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';
import 'package:mobile_study/ui/widgets/congratulation_screen.dart';

class SuccessfulView extends ConsumerWidget {
  const SuccessfulView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(
      CarRentDi.carRentViewModelProvider(null).notifier,
    );

    return CongratulationScreen(
      title: 'Удачной поездки',
      message: 'Бронирование успешно создано',
      subtitle: "",
      // subtitle: 'Перейдите к своим бронированиям',
      onButtonPressed: () {
        viewModel.goToHome();
      },
      buttonText: "Домой",
    );
  }
}
