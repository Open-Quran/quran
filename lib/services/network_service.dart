import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants/restful.dart';
import '../models/translation.dart';

class NetworkService {
  static Future<List<VerseTranslation>> fetchVerseTranslationList(
      int resourceId) async {
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
