import 'package:flutter/foundation.dart';

void handleUncaughtError() {
  FlutterError.onError = (FlutterErrorDetails details) {
    // Log the error
    if (kDebugMode) {
      print('Error: ${details.exception}');
      if (details.stack != null) {
        print('Stack trace: ${details.stack}');
      }
      FlutterError.presentError(details);
    }
  };
}
