import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/settings/add_car/add_car_di.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

class AddCarStep1Screen extends ConsumerStatefulWidget {
  const AddCarStep1Screen({super.key});

  @override
  ConsumerState<AddCarStep1Screen> createState() => _AddCarStep1ScreenState();
}

class _AddCarStep1ScreenState extends ConsumerState<AddCarStep1Screen> {
  late final TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    final currentAddress = ref.read(AddCarDi.addCarFlowProvider).address;
    if (currentAddress != null) {
      addressController.text = currentAddress;
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(AddCarDi.addCarFlowProvider.notifier);

    final isBtnEnabled = ref.watch(
      AddCarDi.addCarFlowProvider.select((state) => state.isStep1Valid),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Добавление автомобиля")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomTextField(
                hint: "Введите адрес",
                controller: addressController,
                label: 'Где расположен ваш автомобиль?',
                onSubmitted: (_) => notifier.submitStep1(),
                onChanged: (value) => notifier.setAddress(value),

                isLoading: false,
              ),
              Spacer(),
              SizedBox(
                height: 50,
                width: 342,
                child: FilledButton(
                  onPressed: isBtnEnabled ? () => notifier.submitStep1() : null,
                  child: Text("Далее"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }
}
