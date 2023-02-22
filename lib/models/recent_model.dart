import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentModel {
  late final ERecentVisitedType eRecentVisitedType;
  late final int index;

  RecentModel({
    required this.index,
    required this.eRecentVisitedType
  });

  RecentModel.fromJson(Map<String, dynamic> json) {
    eRecentVisitedType =
    ERecentVisitedType.values[json['eRecentVisitedType'] as int];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['eRecentVisitedType'] = eRecentVisitedType.index;
    return data;
  }

  name(BuildContext context) {
    switch (eRecentVisitedType) {
      case ERecentVisitedType.juz:
        return "${context.translate.juz} ${index.toString()}";
      case ERecentVisitedType.page:
        return "${context.translate.page} ${index.toString()}";
      case ERecentVisitedType.surah:
        return "${context.translate.surah} ${index.toString()}";
    }
  }

  navigationToSurahDetails(BuildContext context) {
    switch (eRecentVisitedType) {
      case ERecentVisitedType.juz:
        return context.read<SearchProvider>().goToJuz(context, index, true);
      case ERecentVisitedType.page:
        return context.read<SearchProvider>().goToMushaf(context, index, true);
      case ERecentVisitedType.surah:
        return context.read<SearchProvider>().goToSurah(context, index, true);
    }
  }
}
