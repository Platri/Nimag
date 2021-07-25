import 'package:nimag/services/database_service.dart';

Future<void> setup() async {
  await DBService().init();
}
