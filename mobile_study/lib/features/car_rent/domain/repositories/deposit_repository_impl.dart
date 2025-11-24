import 'package:mobile_study/features/car_rent/domain/repositories/deposit_repository.dart';

class DepositRepositoryImpl implements DepositRepository {
  @override
  Future<String> fetchDepositRules(String? carId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return "Правила депозита: \n1. Депозит возвращается полностью при условии отсутствия повреждений.\n2. В случае повреждений, сумма депозита может быть удержана частично или полностью в зависимости от стоимости ремонта.\n3. Депозит должен быть оплачен до начала аренды автомобиля.";
  }
}
