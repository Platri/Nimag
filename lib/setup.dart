import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/database_service.dart';

Future<void> setup() async {
  await LocalStorage().init();
}
