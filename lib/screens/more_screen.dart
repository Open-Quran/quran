import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslateHelper.of(context)?.more ?? ""),
      ),
    );
  }
}
