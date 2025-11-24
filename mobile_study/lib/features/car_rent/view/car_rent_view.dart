import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/car_rent/car_rent_di.dart';
import 'package:mobile_study/features/onboarding/view/onboarding_screen.dart';
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

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: Text("Оформление аренды")),
        body: Center(child: Text(state.error!)),
      );
    }

    if (state.isLoading || state.carRentData == null) {
      return PopScope(
        canPop: !state.isLoading,
        onPopInvoked: (didPop) {},
        child: Scaffold(
          appBar: AppBar(
            title: Text("Оформление аренды"),
            leading: BackButton(
              onPressed: state.isLoading
                  ? null
                  : () {
                      viewModel.goBack();
                    },
            ),
          ),
          body: Center(child: CircularProgressIndicator()),
        ),
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarCardForRentWidget(
                      autoName: carRentData.autoName,
                      autoMark: carRentData.autoMark,
                      price: carRentData.pricePerDay,
                      pricePeriod: "в день",
                      image: carRentData.carCardModel.image,
                    ),
                    const SizedBox(height: 18),
                    DateRowWidget(
                      text: "Начало аренды",
                      date: viewModel.formatRentDate(carRentData.startRentDate),
                      changeDate: (DateTime date) {
                        viewModel.updateStartDate(date);
                      },
                      isStartDate: true,
                    ),
                    const SizedBox(height: 20),

                    DateRowWidget(
                      text: "Конец аренды",
                      date: viewModel.formatRentDate(carRentData.endRentDate),
                      changeDate: (DateTime date) {
                        viewModel.updateEndDate(date);
                      },
                      isStartDate: false,
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
                            Text(
                              "Адрес нахождения",
                              textAlign: TextAlign.start,
                            ),
                            Text(carRentData.adress),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Divider(),
                    const SizedBox(height: 16),
                    _TextCountPriceRow(
                      text: "Аренда автомобиля",
                      count: "x${state.rentDays} дня",
                      price: carRentData.pricePerDay,
                    ),
                    const SizedBox(height: 12),
                    _TextCountPriceRow(
                      text: "Страхование",
                      count: "x${state.rentDays} дня",
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
                          GestureDetector(
                            onTap: () {
                              viewModel.loadDepositInfo();

                              showDialog(
                                context: context,
                                builder: (_) =>
                                    _DepositInfoDialog(carId: carId),
                              );
                            },
                            child: _DepositePriceRow(
                              text: "Возваращаемый депозит",
                              price: carRentData.priceOfDeposit,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

class DateRowWidget extends StatelessWidget {
  final String text;
  final String date;
  final ValueChanged<DateTime> changeDate;
  final bool isStartDate;

  const DateRowWidget({
    super.key,
    required this.text,
    required this.date,
    required this.changeDate,
    required this.isStartDate,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(text, style: textTheme.displayMedium),
        Spacer(),
        TextButton(
          onPressed: () {
            _selectDate(context);
          },
          child: Row(
            children: [
              Text(date, style: textTheme.displayMedium),
              const SizedBox(width: 8),
              const Icon(Icons.edit_outlined, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: "Выберите дату ${isStartDate ? "начала" : "окончания"} аренды",
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
    );
    if (picked != null) {
      if (isStartDate) {
        if (!context.mounted) return;
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          helpText: "Выберите время начала аренды",
        );

        if (pickedTime != null) {
          final DateTime finalDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          changeDate(finalDateTime);
        }
      } else {
        changeDate(picked);
      }
    }
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
        Text("$price₽", style: textTheme.titleSmall?.copyWith(fontSize: 16)),
      ],
    );
  }
}

class _DepositInfoDialog extends ConsumerWidget {
  final String carId;

  _DepositInfoDialog({super.key, required this.carId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final depositState = ref.watch(
      CarRentDi.carRentViewModelProvider(carId).select((s) => s.depositInfo),
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Правила депозита',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.outline,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            depositState.when(
              loading: () => SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              error: (err, _) => Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Не удалось загрузить информацию.\nПопробуйте позже.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 14,
                  ),
                ),
              ),
              data: (text) => Flexible(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
