import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/settings/car_book/car_book_di.dart';
import 'package:mobile_study/ui/widgets/car_card_for_rent.dart';

class CarBookView extends ConsumerWidget {
  final String bookId;
  const CarBookView({super.key, required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CarBookDi.carBookViewModelProvider(bookId));
    final viewModel = ref.watch(
      CarBookDi.carBookViewModelProvider(bookId).notifier,
    );

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: Text("Бронирование")),
        body: Center(child: Text(state.error!)),
      );
    }

    if (state.isLoading) {
      return PopScope(
        canPop: !state.isLoading,
        onPopInvoked: (didPop) {},
        child: Scaffold(
          appBar: AppBar(title: Text("Бронированние")),
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    final carBookModel = state.carBookModel;

    if (carBookModel == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Бронирование")),
        body: Center(child: Text("Данные не были получены")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Бронирование #${bookId}")),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CarCardForRentWidget(
                      autoName: carBookModel.carCardModel.name,
                      autoMark: carBookModel.carCardModel.mark,
                      price: carBookModel.carCardModel.pricePerDay,
                      pricePeriod: "в день",
                      image: carBookModel.carCardModel.image,
                    ),
                    const SizedBox(height: 18),
                    TitleDataRow(
                      title: 'Адрес нахождения',
                      data: carBookModel.adress,
                    ),
                    const SizedBox(height: 10),

                    TitleDataRow(
                      title: 'Начало аренды',
                      data: viewModel.formatRentDate(
                        carBookModel.startRentDate,
                      ),
                    ),
                    const SizedBox(height: 10),

                    TitleDataRow(
                      title: 'Конец аренды',
                      data: viewModel.formatRentDate(carBookModel.endRentDate),
                    ),
                    const SizedBox(height: 10),

                    TitleDataRow(
                      title: 'ФИО водителя',
                      data: carBookModel.driverName,
                    ),
                    const SizedBox(height: 10),

                    TitleDataRow(
                      title: 'Номер ВУ',
                      data: carBookModel.driverLicenseNumber,
                    ),
                    const SizedBox(height: 10),

                    TitleDataRow(
                      title: 'Статус аренды',
                      data: viewModel.formatStatusText,
                    ),
                    const SizedBox(height: 16),
                    Divider(),
                    const SizedBox(height: 16),
                    _TextCountPriceRow(
                      text: "Аренда автомобиля",
                      count: "x${state.rentDays} дня",
                      price: carBookModel.carCardModel.pricePerDay,
                    ),
                    const SizedBox(height: 12),
                    _TextCountPriceRow(
                      text: "Страхование",
                      count: "x${state.rentDays} дня",
                      price: carBookModel.priceOfInsurance,
                    ),
                    const SizedBox(height: 16),
                    Divider(),
                    const SizedBox(height: 16),
                    _FinalPriceRow(
                      text: "Общая сумма",
                      price: carBookModel.totalPrice,
                    ),
                  ],
                ),
              ),
              if (state.isShowCancelButton)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          viewModel.onTapCancelButton();
                        },
                        child: Text("Отменить бронирование"),
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

class TitleDataRow extends StatelessWidget {
  final String title;
  final String data;

  const TitleDataRow({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.displayMedium),
        SizedBox(width: 16),
        // Spacer(),
        Expanded(
          child: Text(
            data,
            style: textTheme.displaySmall,
            textAlign: TextAlign.end,
          ),
        ),
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

class _FinalPriceRow extends StatelessWidget {
  final String text;
  final String price;
  const _FinalPriceRow({super.key, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(text, style: textTheme.titleSmall?.copyWith(fontSize: 20)),
        Spacer(),
        Text("$price₽", style: textTheme.titleSmall?.copyWith(fontSize: 16)),
      ],
    );
  }
}
