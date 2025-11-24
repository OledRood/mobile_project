import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/constants/app_endpoints.dart';
import 'package:mobile_study/core/constants/rent_status.dart';
import 'package:mobile_study/core/models/car/car_book_data_model.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';
import 'package:mobile_study/core/models/car/car_details.dart';
import 'package:mobile_study/core/models/car/car_rent_data.dart';
import 'package:mobile_study/core/models/car/car_history_model.dart';
import 'package:mobile_study/core/services/api_service.dart';

class CarService {
  final ApiService apiService;
  CarService({required this.apiService});

  static final String baseUrl = dotenv.env['API_URL'] ?? "";
  static final String apiVersion = dotenv.env['API_VERSION'] ?? "";
  static final String fullBaseUrl = '$baseUrl/$apiVersion';

  Future<CarDetails?> getCarDetails(String id) async {
    debugPrint("car details id: $id");
    final response = await apiService.get(AppEndpoints.carDetailsById(id));
    final carDetails = CarDetails.fromJson(response);

    return carDetails;
  }

  //точные данные об оплате(для страницы оплаты)
  Future<CarRentData?> getCarRentData(String id) async {
    final carDetails = await getCarDetails(id);

    if (carDetails == null) {
      throw ApiException('Ошибка загрузки данных автомобиля');
    }

    CarRentData carRentData = CarRentData.fromDetails(carDetails);

    return carRentData;
  }

  //Забронировать машину по id
  Future<bool> bookCar(CarRentData carRentData) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      await apiService.post(
        AppEndpoints.carBookById(carRentData.id),
        carRentData.getFieldsForBooking,
      );

      return true;
    } catch (e) {
      rethrow;
      debugPrint('Error booking car: $e');
      return false;
    }
  }

  //Список бронированний пользователя
  Future<List<CarHistoryModel>> getUserRentHistory() async {
    final response = await apiService.getList(AppEndpoints.userRentHistory);
    debugPrint("Rent history response: ${response[0]}");
    final List<CarHistoryModel> rentHistory = (response as List)
        .map((item) => CarHistoryModel.fromJson(item))
        .toList();
    return rentHistory;
  }

  Future<RentStatus> canceledBook(String bookId) async {
    final response = await apiService.post(
      AppEndpoints.carBookCancelById(bookId),
      {},
    );
    return RentStatus.fromJson(response['status']);
  }

  //Получить список избранных атомобилей
  Future<List<CarCardModel>?> getFavorites() async {
    final response = await apiService.getList(AppEndpoints.carFavorites);
    final List<CarCardModel> favoriteCars = (response as List)
        .map((item) => CarCardModel.fromJson(item))
        .toList();
    return favoriteCars;
  }

  Future<List<CarCardModel>> getHomeRecommendations() async {
    final response = await apiService.getList(AppEndpoints.carRecommendations);

    debugPrint('Response data: ${response}');

    final List<CarCardModel> recommendations = (response as List)
        .map((item) => CarCardModel.fromJson(item))
        .toList();
    return recommendations;
  }

  Future<List<CarCardModel>> getSearchResutls(String searchText) async {
    final response = await apiService.getList(
      AppEndpoints.carSearchWithQuery(searchText),
    );
    final List<CarCardModel> searchResults = (response as List)
        .map((item) => CarCardModel.fromJson(item))
        .toList();
    return searchResults;
  }

  Future<CarBookDataModel> getCarBookById(String bookId) async {
    final response = await apiService.get(AppEndpoints.carBookById(bookId));
    debugPrint("Car book response: $response");
    final carBookModel = CarBookDataModel.fromJson(response);
    debugPrint("Car book model: $carBookModel");
    return carBookModel;
  }

  Future<bool?> setNewFavoriteStatus(String id, bool favoriteStatus) async {
    final response = await apiService.post(
      AppEndpoints.carAddToFavoritesById(id),
      {"is_favorite": favoriteStatus},
    );

    final newFavoriteStatus = response['is_favorite'] as bool?;
    debugPrint('New favorite status: $newFavoriteStatus');
    return newFavoriteStatus;
  }

  Future<void> createCar(
    Map<String, dynamic> carData,
    List<String> photoPaths,
  ) async {
    final files = photoPaths.map((path) => File(path)).toList();

    await apiService.postMultipartList(
      AppEndpoints.createCar,
      fields: carData,
      files: files,
      fileFieldKey: 'photos',
    );
  }
}

// CarDetails _getMockedCarDetailsById(String id) {
//   int currentIndex = int.tryParse(id) ?? 0;
//   currentIndex = currentIndex % _mockedDetailsData.length;
//   return _mockedDetailsData[currentIndex];
// }

// CarRentData _getMockedCarRentDataById(String id) {
//   int currentIndex = int.tryParse(id) ?? 0;
//   currentIndex = currentIndex % _mockedCarRentData.length;
//   return _mockedCarRentData[currentIndex];
// }

// final List<CarDetails> _mockedDetailsData = [
//   // BMW X5
//   CarDetails(
//     id: '0',
//     name: 'BMW X5',
//     description:
//         'Комфортный внедорожник премиум-класса, просторный салон, автомат, полный привод',
//     isFavorite: false,
//     location: 'Москва',
//     imageUrl: AppImages.mockedBmwX5Image,
//     pricePerDay: '3500',
//   ),
//   // Mercedes S500
//   CarDetails(
//     id: '1',
//     name: 'Mercedes S500',
//     description:
//         'Седан представительского класса, роскошный интерьер, страховка включена',
//     isFavorite: false,
//     location: 'Москва',
//     imageUrl: AppImages.mockedMercedesImage,
//     pricePerDay: '2000',
//   ),
//   // Lada Largus
//   CarDetails(
//     id: '2',
//     name: 'Lada Largus',
//     description:
//         'Практичный универсал для города и поездок, вместительный багажник',
//     isFavorite: false,
//     location: 'Москва',
//     imageUrl: AppImages.mockedLadaLargusImage,
//     pricePerDay: '200',
//   ),
//   // Tesla Model S
//   CarDetails(
//     id: '3',
//     name: 'Tesla Model S (2019)',
//     description:
//         'Электромобиль, запас хода 450 км, премиум-сегмент, быстрый заряд',
//     isFavorite: false,
//     location: 'Москва',
//     imageUrl: AppImages.mockedAutoDetailsPhoto,
//     pricePerDay: '2500',
//   ),
// ];
// final List<CarRentData> _mockedCarRentData = [
//   // BMW X5
//   CarRentData(
//     id: '0',
//     autoName: 'BMW X5',
//     autoMark: 'BMW',
//     pricePerDay: '3500',
//     startRentDate: '12/11/2025',
//     endRentDate: '14/11/2025',
//     adress: 'Москва, ул. Тверская, 10',
//     priceOfInsurance: '500',
//     totalPrice: '7500',
//     priceOfDeposit: '3000',
//     image: AppImages.mockedBmwX5ImageForCard,
//     transmission: 'Автомат',
//     fuel: 'Бензин',
//   ),
//   // Mercedes S500
//   CarRentData(
//     id: '1',
//     autoName: 'Mercedes S500',
//     autoMark: 'Mercedes',
//     pricePerDay: '2000',
//     startRentDate: '15/11/2025',
//     endRentDate: '18/11/2025',
//     adress: 'Москва, пр. Мира, 7',
//     priceOfInsurance: '400',
//     totalPrice: '6400',
//     priceOfDeposit: '2500',
//     image: AppImages.mockedAutoImage,
//     transmission: 'Автомат',
//     fuel: 'Бензин',
//   ),
//   // Lada Largus
//   CarRentData(
//     id: '2',
//     autoName: 'Lada Largus',
//     autoMark: 'Lada',
//     pricePerDay: '200',
//     startRentDate: '20/11/2025',
//     endRentDate: '25/11/2025',
//     adress: 'Москва, ул. Сущевская, 19',
//     priceOfInsurance: '120',
//     totalPrice: '1120',
//     priceOfDeposit: '1000',
//     image: AppImages.mockedLadaLargusImageForCard,
//     transmission: 'Механика',
//     fuel: 'Бензин',
//   ),
//   // Tesla Model S 2019
//   CarRentData(
//     id: '3',
//     autoName: 'Tesla Model S (2019)',
//     autoMark: 'Tesla',
//     pricePerDay: '2500',
//     startRentDate: '27/11/2025',
//     endRentDate: '30/11/2025',
//     adress: 'Москва, ул. Арбат, 50',
//     priceOfInsurance: '600',
//     totalPrice: '8100',
//     priceOfDeposit: '4000',
//     image: AppImages.mockedTeslaImageForCard,
//     transmission: 'Автомат',
//     fuel: 'Электро',
//   ),
// ];

// final List<CarHistory> _mockedCarHistory = [
//   CarHistory(rentId: '0', status: 'Активен'),
//   CarHistory(rentId: '1', status: 'Завершен'),
//   CarHistory(rentId: '2', status: 'Завершен'),
//   CarHistory(rentId: '3', status: 'Завершен'),
// ];

// final List<CarCardModel> _mockedFavoriteCars = [
//   CarCardModel(
//     id: '0',
//     name: 'BMW X5',
//     mark: 'BMW',
//     pricePerDay: '3500',
//     transmission: 'Автомат',
//     fuel: 'Бензин',
//     image: AppImages.mockedBmwX5ImageForCard,
//   ),
//   CarCardModel(
//     id: '1',
//     name: 'Mercedes S500',
//     mark: 'Mercedes',
//     pricePerDay: '2000',
//     transmission: 'Автомат',
//     fuel: 'Бензин',
//     image: AppImages.mockedAutoImage,
//   ),
//   CarCardModel(
//     id: '2',
//     name: 'Lada Largus',
//     mark: 'Lada',
//     pricePerDay: '200',
//     transmission: 'Механика',
//     fuel: 'Бензин',
//     image: AppImages.mockedLadaLargusImageForCard,
//   ),
//   CarCardModel(
//     id: '3',
//     name: 'Tesla Model S (2019)',
//     mark: 'Tesla',
//     pricePerDay: '2500',
//     transmission: 'Автомат',
//     fuel: 'Электро',
//     image: AppImages.mockedTeslaImageForCard,
//   ),
// ];

class CarServiceDi {
  final carServiceProvider = Provider<CarService>((ref) {
    final apiService = ref.watch(ApiServiceDi.apiServiceProvider);
    return CarService(apiService: apiService);
  });
}
