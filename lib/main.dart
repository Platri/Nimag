import 'package:flutter/material.dart';
import 'package:nimag/setup.dart';

import 'app.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(App());
}
