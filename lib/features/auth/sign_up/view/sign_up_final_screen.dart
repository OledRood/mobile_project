import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class SignUpFinalScreen extends ConsumerWidget {
  const SignUpFinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final viewModel = ref.read(AuthDi.sl.notifier);
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text(
                  'Пользуйтесь с удовольствием',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Spacer(flex: 2),

                SvgPicture.asset(AppImages.checkCircle, width: 96, height: 96),

                Spacer(flex: 1),
                Text(
                  "Поздравляем",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Spacer(flex: 1),
                Text(
                  "Вы успешно зарегистрировались.\nОбработка ваших персональных данных\nзаймет около двух часов.\nСпасибо за ожидание.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Spacer(flex: 2),
                SizedBox(
                  height: 50,
                  width: 342,
                  child: FilledButton(onPressed: () {}, child: Text("Далее")),
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
