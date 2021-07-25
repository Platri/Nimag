import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final String _nimagStartTimeKey = 'start_time_key';
final String _timerStartTimeKey = 'timer_start_key';
final String _nimagCountKey = 'nimag_count_key';

class DBService {
  static Box? _hiveBoxMain;
  static String _mainBoxName = 'favoriteId';

  Future<DBService> init() async {
    await Hive.initFlutter();
    _hiveBoxMain ??= await Hive.openBox<dynamic>(_mainBoxName);

    if (_hiveBoxMain!.isEmpty) {}

    return this;
  }

  DBService get dbService => this;

  Future clear() async {
    await _hiveBoxMain!.clear();
  }

  Future<DateTime?> getNimagStartTime() async {
    try {
      DateTime? nimagStartTime = await _hiveBoxMain?.get(_nimagStartTimeKey);
      return nimagStartTime;
    } catch (e) {
      print('error while getting Nimag start time');
      throw e;
    }
  }

  Future putNimagStartTime(DateTime time) async {
    try {
      await _hiveBoxMain!.put(_nimagStartTimeKey, time);
    } catch (e) {
      print('error while putting Nimag start time');
      throw e;
    }
  }

  ///gets timer start time or returns null, if not yet started
  Future<DateTime?> getTimerStartTime() async {
    try {
      DateTime? startTime = await _hiveBoxMain!.get(_timerStartTimeKey);
      return startTime;
    } catch (e) {
      print('error while getting timer start time');
      throw e;
    }
  }

  Future putTimerStartTime(DateTime time) async {
    try {
      await _hiveBoxMain!.put(_timerStartTimeKey, time);
    } catch (e) {
      print('error while putting timer start time');
      throw e;
    }
  }

  Future putNimagCount(int count) async {
    try {
      await _hiveBoxMain!.put(_nimagCountKey, count);
    } catch (e) {
      print('error while putting nimag count');
      throw e;
    }
  }

  Future<int?> getNimagCount() async {
    try {
      int? nimagCount = await _hiveBoxMain!.get(_nimagCountKey);
      return nimagCount;
    } catch (e) {
      print('error while getting nimag count');
      throw e;
    }
  }
}
