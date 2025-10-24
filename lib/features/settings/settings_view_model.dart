// import 'package:flutter/material.dart';
// import '../../core/services/storage_service.dart';

// class SettingsViewModel extends ChangeNotifier {
//   bool _notificationsEnabled = true;
//   bool _darkModeEnabled = false;
//   String _selectedLanguage = 'English';

//   bool get notificationsEnabled => _notificationsEnabled;
//   bool get darkModeEnabled => _darkModeEnabled;
//   String get selectedLanguage => _selectedLanguage;

//   SettingsViewModel() {
//     _loadSettings();
//   }

//   void _loadSettings() {
//     _notificationsEnabled = StorageService.getBool('notifications_enabled') ?? true;
//     _darkModeEnabled = StorageService.getBool('dark_mode_enabled') ?? false;
//     _selectedLanguage = StorageService.getString('selected_language') ?? 'English';
//     notifyListeners();
//   }

//   void toggleNotifications(bool value) {
//     _notificationsEnabled = value;
//     StorageService.setBool('notifications_enabled', value);
//     notifyListeners();
//   }

//   void toggleDarkMode(bool value) {
//     _darkModeEnabled = value;
//     StorageService.setBool('dark_mode_enabled', value);
//     notifyListeners();
//   }

//   void selectLanguage() {
//     // Show language selection dialog
//     // This would typically show a dialog or navigate to language selection
//   }

//   void navigateToProfile() {
//     // Navigate to profile screen
//   }

//   void navigateToHelp() {
//     // Navigate to help screen
//   }

//   void navigateToAbouVj;tt() {
//     // Navigate to about screen
//   }

//   void logout() {
//     // Clear storage and navigate to login
//     StorageService.clear();
//     // Navigate to login screen
//   }
// }
