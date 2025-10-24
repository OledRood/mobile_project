// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../../core/models/booking.dart';
// import '../../core/repositories/booking_repository.dart';
// import '../../core/services/api_service.dart';

// class SearchViewModel extends ChangeNotifier {
//   final TextEditingController searchController = TextEditingController();
//   final BookingRepository _bookingRepository = BookingRepository(ApiService());
  
//   List<Booking> _searchResults = [];
//   bool _isLoading = false;
//   Timer? _debounceTimer;

//   List<Booking> get searchResults => _searchResults;
//   bool get isLoading => _isLoading;

//   SearchViewModel() {
//     searchController.addListener(_onSearchTextChanged);
//   }

//   void _onSearchTextChanged() {
//     notifyListeners();
//   }

//   void onSearchChanged(String query) {
//     _debounceTimer?.cancel();
//     _debounceTimer = Timer(const Duration(milliseconds: 500), () {
//       if (query.isNotEmpty) {
//         _performSearch(query);
//       } else {
//         _clearResults();
//       }
//     });
//   }

//   Future<void> _performSearch(String query) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       _searchResults = await _bookingRepository.searchBookings(query);
//     } catch (e) {
//       _searchResults = [];
//       // Handle error
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void _clearResults() {
//     _searchResults = [];
//     notifyListeners();
//   }

//   void clearSearch() {
//     searchController.clear();
//     _clearResults();
//   }

//   void selectBooking(Booking booking) {
//     // Navigate to booking details or booking screen
//     // This would typically use a navigation service
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     _debounceTimer?.cancel();
//     super.dispose();
//   }
// }