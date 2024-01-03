import 'package:flutter/material.dart';
import 'package:punk/error_handling.dart';
import 'package:punk/router.dart';

import 'services/locator.dart';
import 'punk_app.dart';

void main() {
  handleUncaughtError();
  setupLocator(isMock: true);
  runApp(PunkApp(goRouter: createRouter()));
}
