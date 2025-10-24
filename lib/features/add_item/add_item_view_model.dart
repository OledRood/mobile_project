import 'package:flutter/material.dart';
import 'package:mobile_study/core/models/booking.dart';
import '../../core/repositories/booking_repository.dart';
import '../../core/services/api_service.dart';

class AddItemViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final BookingRepository _bookingRepository = BookingRepository(ApiService());

  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedImage;
  bool _isLoading = false;

  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String? get selectedImage => _selectedImage;
  bool get isLoading => _isLoading;

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price is required';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Please enter a valid price';
    }
    return null;
  }

  Future<void> selectStartDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      _startDate = date;
      notifyListeners();
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      _endDate = date;
      notifyListeners();
    }
  }

  void selectImage() {
    // Implement image selection
    // This would typically use image_picker package
    _selectedImage = 'https://via.placeholder.com/300x200';
    notifyListeners();
  }

  Future<void> saveItem() async {
    if (!formKey.currentState!.validate()) return;
    if (_startDate == null || _endDate == null) {
      _showError('Please select start and end dates');
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final bookingData = {
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'price': double.parse(priceController.text),
        'location': locationController.text.trim(),
        'startDate': _startDate!.toIso8601String(),
        'endDate': _endDate!.toIso8601String(),
        'imageUrl': _selectedImage,
      };

      final booking = await _bookingRepository.createBooking(
        bookingData as Booking,
      );

      if (booking != null) {
        _showSuccess('Item added successfully');
        _clearForm();
        // Navigate back
      } else {
        _showError('Failed to add item');
      }
    } catch (e) {
      _showError('Failed to add item. Please try again.');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _clearForm() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    locationController.clear();
    _startDate = null;
    _endDate = null;
    _selectedImage = null;
    notifyListeners();
  }

  void _showError(String message) {
    // Show error message
    // This would typically use a snackbar
  }

  void _showSuccess(String message) {
    // Show success message
    // This would typically use a snackbar
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
