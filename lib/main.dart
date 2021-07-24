import 'package:flutter/material.dart';
import 'package:nimag/setup.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(App());
}
