import 'package:flutter/material.dart';
import '../../core/models/booking.dart';
import '../../core/repositories/booking_repository.dart';
import '../../core/services/api_service.dart';

class BookingViewModel extends ChangeNotifier {
  final BookingRepository _bookingRepository = BookingRepository(ApiService());
  
  List<Booking> _bookings = [];
  bool _isLoading = true;

  List<Booking> get bookings => _bookings;
  bool get isLoading => _isLoading;

  BookingViewModel() {
    _loadBookings();
  }

  Future<void> _loadBookings() async {
    _isLoading = true;
    notifyListeners();

    try {
      _bookings = await _bookingRepository.getBookings();
    } catch (e) {
      _bookings = [];
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectBooking(Booking booking) {
    // Navigate to booking details
    // This would typically use a navigation service
  }

  void navigateToAddBooking() {
    // Navigate to add booking screen
    // This would typically use a navigation service
  }

  Future<void> refreshBookings() async {
    await _loadBookings();
  }
}