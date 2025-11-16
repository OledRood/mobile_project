class CarCardModel {
  final String id;
  final String autoName;
  final String autoMark;
  final String price;
  final String pricePeriod;
  final String transmission;
  final String fuel;
  final String? image;

  const CarCardModel({
    required this.id,
    required this.autoName,
    required this.autoMark,
    required this.price,
    required this.pricePeriod,
    required this.transmission,
    required this.fuel,
    required this.image,
  });
}
