import 'package:get_storage/get_storage.dart';

class LocalDb {
  LocalDb._();
  static final GetStorage _localDbBox = GetStorage('FabrikodQuran');

  static String? get getLanguageCode => _localDbBox.read('languageCode');

  static Future setLanguageCode(String languageCode) async {
    await _localDbBox.write('languageCode', languageCode);
  }
}
