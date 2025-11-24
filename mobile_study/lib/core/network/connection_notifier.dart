import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_routes.dart';

final connectionErrorProvider = StateNotifierProvider<ConnectionNotifier, bool>(
  (ref) {
    return ConnectionNotifier();
  },
);

class ConnectionNotifier extends StateNotifier<bool> {
  ConnectionNotifier() : super(false);

  String? _previousPath;
  String? get previousPath => _previousPath;

  void triggerError() {
    if (!state) state = true;
  }

  void savePath(String path) {
    debugPrint('ConnectionNotifier: Attempting to save path: $path');
    // LOGIC: Inside `savePath`, strictly ignore these paths: `AppRoutes.noConnection.path`, `AppRoutes.splash.path`, and `'/'`. Only save the path if it's a "content" screen.
    if (path.contains(AppRoutes.noConnection.path) ||
        path == AppRoutes.splash.path ||
        path == '/') {
      debugPrint('ConnectionNotifier: Ignoring path: $path');
      return;
    }
    _previousPath = path;
    debugPrint('ConnectionNotifier: Path saved: $_previousPath');
  }

  void resetError() {
    if (state) state = false;
  }
}
