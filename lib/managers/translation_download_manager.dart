import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../constants/enums.dart';
import '../models/translation.dart';

class TranslationDownloadManager {
  static File? _file;

  static const _fileName = 'translationAuthors.json';

  /// Get the data file
  static Future<File> get file async {
    if (_file != null) return _file!;

    _file = await _initFile();
    return _file!;
  }

  /// Initialize file
  static Future<File> _initFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/$_fileName');
  }

  /// Get Translation Authors
  static Future<List<TranslationAuthor>> getTranslationAuthors() async {
    final fl = await file;
    if (!fl.existsSync()) return [];
    final content = await fl.readAsString();
    final List<dynamic> jsonData = jsonDecode(content) ?? [];
    final List<TranslationAuthor> translationAuthors =
        jsonData.map((e) => TranslationAuthor.fromJson(e as Map<String, dynamic>)).toList().cast<TranslationAuthor>();
    return translationAuthors;
  }

  /// Save Data of Author to local
  static Future<void> setTranslationAuthor(TranslationAuthor translationAuthor) async {
    translationAuthor.verseTranslationState = EVerseTranslationState.downloaded;
    var translationAuthors = await getTranslationAuthors();
    translationAuthors.add(translationAuthor);
    List<Map<String, dynamic>> list = translationAuthors.map((e) => e.toJson()).toList();
    String jsonData = jsonEncode(list);
    final fl = await file;
    fl.writeAsString(jsonData);
  }

  /// Change Selected State of Author to local
  static Future<void> changeSelectedStateOfAuthor(int resourceId, bool newState) async {
    var translationAuthors = await getTranslationAuthors();
    var index = translationAuthors.indexWhere((element) => element.resourceId == resourceId);
    if (index == -1) return;
    translationAuthors[index].isTranslationSelected = newState;
    List<Map<String, dynamic>> list = translationAuthors.map((e) => e.toJson()).toList();
    String jsonData = jsonEncode(list);
    final fl = await file;
    fl.writeAsString(jsonData);
  }

  /// Delete a Downloaded Translation
  static Future<void> deleteTranslationAuthor(TranslationAuthor translationAuthor) async {
    var translationAuthors = await getTranslationAuthors();
    var index = translationAuthors.indexWhere((element) => element.resourceId == translationAuthor.resourceId);
    if (index == -1) return;
    translationAuthors.removeAt(index);
    List<Map<String, dynamic>> list = translationAuthors.map((e) => e.toJson()).toList();
    String jsonData = jsonEncode(list);
    final fl = await file;
    fl.writeAsString(jsonData);
  }
}
