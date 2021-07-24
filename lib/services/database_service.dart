import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static Box? _hiveBoxMain;

  static String _mainBoxName = 'favoriteId';

  Future init() async {
    await Hive.initFlutter();
    _hiveBoxMain ??= await Hive.openBox<dynamic>(_mainBoxName);

    if (_hiveBoxMain!.isEmpty) {
      putScreen(0);
      putNimagCount('1');
    }

    return this;
  }

  Future putScreen(int screenId) async {
    try {
      await _hiveBoxMain!.put(0, screenId);
    } catch (e) {
      throw e;
    }
  }

  Future getScreen() async {
    try {
      int screen = await _hiveBoxMain!.getAt(0);
      return screen;
    } catch (e) {
      throw e;
    }
  }

  Future putNimagTime(DateTime nimagTime) async {
    try {
      await _hiveBoxMain!.put(1, nimagTime);
    } catch (e) {
      throw e;
    }
  }

  Future getNimagTime() async {
    try {
      DateTime nimagTime = await _hiveBoxMain!.getAt(1);
      return nimagTime;
    } catch (e) {
      throw e;
    }
  }

  Future putNimagCount(String nimagCount) async {
    try {
      await _hiveBoxMain!.put(2, nimagCount);
    } catch (e) {
      throw e;
    }
  }

  Future getNimagCount() async {
    try {
      String nimagCount = await _hiveBoxMain!.getAt(2);
      return nimagCount;
    } catch (e) {
      throw e;
    }
  }
}
