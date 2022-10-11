import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:fabrikod_quran/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: TranslateHelper.of(context)?.more ?? "",
      ),
    );
  }
}
