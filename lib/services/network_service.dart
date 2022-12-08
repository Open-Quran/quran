import 'dart:convert';

import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkService {
  static Future<List<VerseTranslation>> fetchVerseTranslationList(int resourceId) async {
    String url = RestfulConstants.verseTranslation(resourceId);
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["translations"]
          .map((e) => VerseTranslation.fromJson(e))
          .toList()
          .cast<VerseTranslation>();
    } else {
      return [];
    }
  }
}
