import 'package:get_storage/get_storage.dart';

class ELocalStorge {
  static final ELocalStorge _instance = ELocalStorge._internal();

  factory ELocalStorge() {
    return _instance;
  }

  ELocalStorge._internal();

  final _storge = GetStorage();

  Future<void> saveData<T>(String key, T value) async {
    await _storge.write(key, value);
  }

  T? readData<T>(String key) {
    return _storge.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storge.remove(key);
  }

  Future<void> clearAllData() async {
    await _storge.erase();
  }
}
