import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimag/services/database_service.dart';

void setup() async {
  await LocalStorage().init();
}
