import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/car_rent/car_rent_di.dart';
import 'package:mobile_study/ui/widgets/car_card.dart';
import 'package:mobile_study/ui/widgets/car_card_for_rent.dart';

class CarRentScreen extends ConsumerWidget {
  final String carId;
  const CarRentScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CarRentDi.carRentViewModelProvider(carId));
    final viewModel = ref.watch(
      CarRentDi.carRentViewModelProvider(carId).notifier,
    );

    if (state.isLoading || state.carRentData == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Оформление аренды")),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final carRentData = state.carRentData!;
    return Scaffold(
      appBar: AppBar(title: Text("Оформление аренды")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarCardForRentWidget(
                    autoName: carRentData.autoName,
                    autoMark: carRentData.autoMark,
                    price: carRentData.pricePerDay,
                    pricePeriod: "в день",
                    image: carRentData.image,
                  ),
                  const SizedBox(height: 18),
                  _TextDateRow(
                    text: "Начало аренды",
                    date: carRentData.startRentDate,
                  ),
                  const SizedBox(height: 12),

                  _TextDateRow(
                    text: "Конец аренды",
                    date: carRentData.endRentDate,
                  ),
                  const SizedBox(height: 16),

                  Divider(),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(carRentData.adress),
                          Text("Адрес нахождения", textAlign: TextAlign.start),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Divider(),
                  const SizedBox(height: 16),
                  _TextCountPriceRow(
                    text: "Аренда автомобиля",
                    count: "x3 дня",
                    price: carRentData.pricePerDay,
                  ),
                  const SizedBox(height: 12),
                  _TextCountPriceRow(
                    text: "Страхование",
                    count: "x3 дня",
                    price: carRentData.priceOfInsurance,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(16),
                    height: 88,
                    width: 342,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surfaceContainer,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _FinalPriceRow(
                          text: "Итого",
                          price: carRentData.totalPrice,
                        ),
                        const SizedBox(height: 12),
                        _DepositePriceRow(
                          text: "Возваращаемый депозит",
                          price: carRentData.priceOfDeposit,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        viewModel.goToSuccessfull();
                      },
                      child: Text("Продолжить"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextDateRow extends StatelessWidget {
  final String text;
  final String date;

  const _TextDateRow({super.key, required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(text, style: textTheme.displayMedium),
        Spacer(),
        Text(date, style: textTheme.displayMedium),
      ],
    );
  }
}

class _TextCountPriceRow extends StatelessWidget {
  final String text;
  final String count;

  final String price;

  const _TextCountPriceRow({
    super.key,
    required this.text,
    required this.count,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(text, style: textTheme.displayMedium),
        SizedBox(width: 5),
        Text(
          "$count:",
          style: textTheme.displayMedium?.copyWith(
            color: colorScheme.outlineVariant,
          ),
        ),
        Spacer(),
        Text("$price₽/день", style: textTheme.displayMedium),
      ],
    );
  }
}

class _DepositePriceRow extends StatelessWidget {
  final String text;
  final String price;
  const _DepositePriceRow({super.key, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          text,
          style: textTheme.displaySmall?.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        Spacer(),
        Text(price, style: textTheme.displaySmall),
      ],
    );
  }
}

class _FinalPriceRow extends StatelessWidget {
  final String text;
  final String price;
  const _FinalPriceRow({super.key, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(text, style: textTheme.titleSmall?.copyWith(fontSize: 16)),
        Spacer(),
        Text(price, style: textTheme.titleSmall?.copyWith(fontSize: 16)),
      ],
    );
  }
}
