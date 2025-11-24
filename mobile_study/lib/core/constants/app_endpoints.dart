class AppEndpoints {
  AppEndpoints._();

  static const String carList = '/car/list';

  static const String carDetails = '/car/details';

  static const String carSearch = '/car/search';
  static const String carBook = '/car/book';
  static const String cancelBook = '/car/book/cancel';

  static const String carRecommendations = '/car/recommendations';

  static const String carFavorites = '/car/favorites';

  static const String carAddToFavorites = '/car/favorite';

  static const String carRemoveFromFavorites = '/car/favorites';

  static const String carBookData = '/car/book';

  static const String userProfile = '/user/profile';

  static const String userUpdateProfile = '/user/profile';

  static const String userRentHistory = '/car/rent/history';

  static const String userRentDetails = '/user/rent-details';

  static const String createCar = '/car/create';

  // AUTH
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authRefresh = '/auth/refresh';
  static const String authLogout = '/auth/logout';
  static const String authGoogle = '/auth/google';
  static const String authValidate = '/auth/validate';

  static const String usersMe = '/users/me';

  static const String uploadImage = '/upload/image';
  static const String uploadDocuments = '/upload/documents';

  static String carDetailsById(String id) => '$carDetails/$id';

  static String carBookById(String id) => '$carBook/$id';

  static String carBookDataById(String id) => '$carBookData/$id';

  static String userRentDetailsById(String rentId) =>
      '$userRentDetails/$rentId';

  static String carAddToFavoritesById(String id) => '$carAddToFavorites/$id';

  static String carRemoveFromFavoritesById(String id) =>
      '$carRemoveFromFavorites/$id';

  static String carSearchWithQuery(String query) {
    final encodedQuery = Uri.encodeQueryComponent(query);
    return '$carSearch?q=$encodedQuery';
  }

  static String carListWithPagination({required int page, required int limit}) {
    return '$carList?page=$page&limit=$limit';
  }

  static String carBookCancelById(String bookId) => '$cancelBook/$bookId';
}
