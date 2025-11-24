import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/add_car/add_car_di.dart';

class BecomeHostScreen extends ConsumerWidget {
  const BecomeHostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(AddCarDi.addCarFlowProvider.notifier);
    final state = ref.watch(AddCarDi.addCarFlowProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Стать арендодателем")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Узнайте, что включает в себя становление арендодателем в приложении. Присоединяйтесь к тысячам владельцев, зарабатывающих в приложении.",
              ),
              SizedBox(height: 16),
              _ColorContainerWidget(
                title: "Как это работает",
                subtitle:
                    "Размещение бесплатное,  вы можете устанавливать свои цены, доступность и правила. Получение и возврат автомобиля просты, а оплата производится быстро после каждой поездки. ",

                icon: Icons.settings_outlined,
              ),
              SizedBox(height: 16),

              _ColorContainerWidget(
                title: "Политика страхования",
                subtitle:
                    "Доступны различные уровни защиты автомобиля на случай непредвиденных ситуаций.",
                icon: Icons.shield_outlined,
              ),
              SizedBox(height: 16),

              _ColorContainerWidget(
                title: "Мы поддержим вас",
                subtitle:
                    "От проверки арендаторов до поддержки клиентов – вы всегда можете делиться своим автомобилем с уверенностью.",
                icon: Icons.support_agent_outlined,
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    notifier.submitBecomeHost();
                  },
                  child: Text("Начать"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorContainerWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _ColorContainerWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 32),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyle.titleSmall?.copyWith(fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(subtitle, style: textStyle.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
