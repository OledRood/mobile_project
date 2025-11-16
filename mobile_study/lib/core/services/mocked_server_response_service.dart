class MockedCarModel {
  final String id;
  final String autoName;
  final String autoMark;
  final String pricePerDay;
  final String startRentDate;
  final String endRentData;
  final String adress;
  final String priceOfInsurance;
  final String totalPrice;
  final String priceOfDeposit;
  final String transmission;
  final String fuel;

  final String driverName;
  final String driverLicenseNumber;
  final String status;

  final String description;
  final bool isFavorite;
  final String loacation;
  final String imageUrl;

  MockedCarModel({
    required this.id,
    required this.autoName,
    required this.autoMark,
    required this.description,
    required this.isFavorite,
    required this.loacation,
    required this.imageUrl,
    required this.pricePerDay,
    required this.startRentDate,
    required this.endRentData,
    required this.adress,
    required this.priceOfInsurance,
    required this.totalPrice,
    required this.priceOfDeposit,
    required this.transmission,
    required this.fuel,
    required this.driverName,
    required this.driverLicenseNumber,
    required this.status,
  });
}

class MockedServerResponseService {}
