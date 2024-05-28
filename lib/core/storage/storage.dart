import 'package:hive/hive.dart';
import 'package:quickfix/core/storage/storage.dart';
export 'package:path_provider/path_provider.dart';

enum LocalStorageKeys {
  /// ---- User Token
  token,
  isFirstTime,
}

enum LocalBox {
  userBox,
}

class Storage {
  static Storage instance = Storage._();

  Storage._();

  factory Storage() {
    return instance;
  }

  /// ----- declare boxes
  late final Box userDataBox;

  Future<void> initHive() async {
    /// ----- initialize Hive
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await appDocumentDir.create(recursive: true);
    Hive.init(appDocumentDir.path);

    /// ----- open boxes
    userDataBox = await Hive.openBox(LocalBox.userBox.name);
  }

  String get token =>
      userDataBox.get(LocalStorageKeys.token.name, defaultValue: "");

  /// ---- Write, read and clear functions
  Future<void> writeToUserBox(String key, dynamic value) async {
    await userDataBox.put(key, value);
  }

  T readFromUserBox<T>(String key) {
    return userDataBox.get(key);
  }

  Future<int> clearUserDataBox() async {
    return await userDataBox.clear();
  }

  Future clearUserToken() async {
    return await userDataBox.delete(LocalStorageKeys.token.name);
  }
}
