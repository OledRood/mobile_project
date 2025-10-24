class SearchResultModel {
  final String id;
  final String autoName;
  final String autoMark;
  final String price;
  final String pricePeriod;
  final String transmission;
  final String fuel;

  SearchResultModel({
    required this.id,
    required this.autoName,
    required this.autoMark,
    required this.price,
    required this.pricePeriod,
    required this.transmission,
    required this.fuel,
  });

  factory SearchResultModel.mockedData(int id) {
    return SearchResultModel(
      id: id.toString(),
      autoName: "S 500 Sedan",
      autoMark: "Mercedes-Benz",
      price: "2000",
      pricePeriod: "в день",
      transmission: "A/T",
      fuel: "Бензин",
    );
  }
}
