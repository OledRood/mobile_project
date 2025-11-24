import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/settings/add_car/add_car_di.dart';
import 'package:mobile_study/features/settings/add_car/models/transmition_type.dart';
import 'package:mobile_study/ui/widgets/custom_dropdopwn_field.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

class AddCarStep2Screen extends ConsumerStatefulWidget {
  const AddCarStep2Screen({super.key});

  @override
  ConsumerState<AddCarStep2Screen> createState() => _AddCarStep2ScreenState();
}

class _AddCarStep2ScreenState extends ConsumerState<AddCarStep2Screen> {
  late TextEditingController yearController;
  late TextEditingController markController;
  late TextEditingController modelController;
  late TextEditingController transmissionController;
  late TextEditingController mileageController;
  late TextEditingController descriptionController;
  late final FocusNode _yearFocus;
  late final FocusNode _markFocus;
  late final FocusNode _modelFocus;
  late final FocusNode _discriptionFocus;
  @override
  void initState() {
    super.initState();
    yearController = TextEditingController();
    markController = TextEditingController();
    modelController = TextEditingController();
    transmissionController = TextEditingController();
    mileageController = TextEditingController();
    descriptionController = TextEditingController();
    _yearFocus = FocusNode();
    _markFocus = FocusNode();
    _modelFocus = FocusNode();
    _discriptionFocus = FocusNode();
  }

  @override
  void dispose() {
    yearController.dispose();
    markController.dispose();
    modelController.dispose();
    transmissionController.dispose();
    mileageController.dispose();
    descriptionController.dispose();
    _yearFocus.dispose();
    _markFocus.dispose();
    _modelFocus.dispose();
    _discriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double separatorHeight = 16.0;
    final notifier = ref.read(AddCarDi.addCarFlowProvider.notifier);
    final state = ref.watch(AddCarDi.addCarFlowProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Добавление автомобиля")),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      label: "Год выпуска",
                      hint: "Год",
                      isLoading: false,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        notifier.setDetailsYear(value);
                      },
                      onSubmitted: (_) {
                        _markFocus.requestFocus();
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Только цифры (нужен import services)
                        LengthLimitingTextInputFormatter(
                          4,
                        ), // Максимум 4 символа
                      ],
                      controller: yearController,
                    ),
                    const SizedBox(height: separatorHeight),
                    CustomTextField(
                      label: "Марка автомобиля",
                      hint: "Марка",
                      focusNode: _markFocus,
                      onSubmitted: (_) {
                        _modelFocus.requestFocus();
                      },
                      onChanged: (value) {
                        notifier.setDetailsMark(value);
                      },
                      isLoading: false,
                      controller: markController,
                    ),
                    const SizedBox(height: separatorHeight),

                    CustomTextField(
                      label: "Модель автомобиля",
                      isLoading: false,
                      focusNode: _modelFocus,
                      onChanged: (value) {
                        notifier.setDetailsModel(value);
                      },
                      onSubmitted: (_) {
                        _yearFocus.requestFocus();
                      },
                      hint: "Модель",
                      controller: modelController,
                    ),
                    const SizedBox(height: separatorHeight),

                    CustomDropdownField<TransmissionType>(
                      label: "Трансмиссия",
                      value: ref.watch(
                        AddCarDi.addCarFlowProvider.select(
                          (s) => s.transmission,
                        ),
                      ),
                      items: TransmissionType.values,
                      itemLabelBuilder: (type) => type.label,
                      onChanged: (val) => notifier.setDetailsTransmission(val),
                    ),
                    const SizedBox(height: separatorHeight),

                    CustomTextField(
                      label: "Пробег",
                      hint: "Пробег",
                      isLoading: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      controller: mileageController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        notifier.setDetailsMeleage(value);
                      },
                      onSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const SizedBox(height: separatorHeight),

                    CustomTextField(
                      label: "Описание",
                      controller: descriptionController,
                      focusNode: _discriptionFocus,
                      onChanged: (description) {
                        notifier.setDetailsDescription(description);
                      },
                      hint:
                          "Пожалуйста, добавьте дополнительную информацию о вашем автомобиле, которая может быть интересна арендатору. Например, о внутреннем оформлении, мощности и других особенностях вашего автомобиля.",
                      isLoading: false,
                      maxLines: 8,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 342,
                child: FilledButton(
                  onPressed: state.isStep2Valid
                      ? () => notifier.submitStep2()
                      : null,
                  child: Text("Далее"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
