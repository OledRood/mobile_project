import '../models/booking.dart';
import '../services/api_service.dart';

class BookingRepository {
  final ApiService _apiService;

  BookingRepository(this._apiService);

  Future<List<Booking>> getAllBookings() async {
    try {
      // Используем mock данные для демонстрации
      await Future.delayed(const Duration(seconds: 1));

      return [
        Booking(
          id: '1',
          title: 'Hotel California',
          description: 'Luxury hotel in the heart of the city',
          location: 'Los Angeles, CA',
          price: '\$250/night',
          date: DateTime.now().add(const Duration(days: 1)),
          status: BookingStatus.confirmed,
        ),
        Booking(
          id: '2',
          title: 'Beach Resort',
          description: 'Beautiful beachfront resort',
          location: 'Miami, FL',
          price: '\$180/night',
          date: DateTime.now().add(const Duration(days: 3)),
          status: BookingStatus.pending,
        ),
        Booking(
          id: '3',
          title: 'Mountain Lodge',
          description: 'Cozy lodge in the mountains',
          location: 'Aspen, CO',
          price: '\$320/night',
          date: DateTime.now().add(const Duration(days: 7)),
          status: BookingStatus.completed,
        ),
      ];
    } catch (e) {
      throw Exception('Failed to load bookings: $e');
    }
  }

  Future<List<Booking>> getFavoriteBookings() async {
    try {
      final allBookings = await getAllBookings();
      return allBookings.where((booking) => booking.isFavorite).toList();
    } catch (e) {
      throw Exception('Failed to load favorite bookings: $e');
    }
  }

  Future<Booking> createBooking(Booking booking) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Возвращаем booking с новым ID
      return booking.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    } catch (e) {
      throw Exception('Failed to create booking: $e');
    }
  }

  Future<Booking> updateBooking(Booking booking) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return booking;
    } catch (e) {
      throw Exception('Failed to update booking: $e');
    }
  }

  Future<void> deleteBooking(String bookingId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      throw Exception('Failed to delete booking: $e');
    }
  }

  Future<Booking> toggleFavorite(Booking booking) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      return booking.copyWith(isFavorite: !booking.isFavorite);
    } catch (e) {
      throw Exception('Failed to toggle favorite: $e');
    }
  }

  Future<List<Booking>> getBookings() async {
    return [];
  }

  Future<List<Booking>> getFavorites() async {
    return [];
  }
}
