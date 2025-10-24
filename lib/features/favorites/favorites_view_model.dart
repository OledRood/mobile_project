import 'package:flutter/material.dart';
import '../../core/models/booking.dart';
import '../../core/repositories/booking_repository.dart';
import '../../core/services/api_service.dart';

class FavoritesViewModel extends ChangeNotifier {
  final BookingRepository _bookingRepository = BookingRepository(ApiService());
  
  List<Booking> _favorites = [];
  bool _isLoading = true;

  List<Booking> get favorites => _favorites;
  bool get isLoading => _isLoading;

  FavoritesViewModel() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    try {
      _favorites = await _bookingRepository.getFavorites();
    } catch (e) {
      _favorites = [];
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectFavorite(Booking booking) {
    // Navigate to booking details
    // This would typically use a navigation service
  }

  Future<void> removeFromFavorites(Booking booking) async {
    // Remove from favorites
    _favorites.removeWhere((item) => item.id == booking.id);
    notifyListeners();
    
    // Make API call to remove from favorites
    // This would typically call the API to remove the favorite
  }

  Future<void> refreshFavorites() async {
    await _loadFavorites();
  }
}