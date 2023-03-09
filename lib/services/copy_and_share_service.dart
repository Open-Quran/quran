import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_open_quran/constants/constants.dart';

class CopyAndShareService {
  CopyAndShareService._();

  static share(String text) async {
    await Share.share(text);
  }

  static copy(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.translate.copied),
        ),
      );
    });
  }
}
