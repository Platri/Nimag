import 'package:flutter/material.dart';
import 'package:nimag/services/database_service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBService dbService = await DBService().init();
  runApp(App(
    dbService: dbService,
  ));
}
