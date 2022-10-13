import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:fabrikod_quran/widgets/app_bars/custom_app_bar.dart';
import 'package:fabrikod_quran/widgets/buttons/back_button.dart';
import 'package:flutter/material.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  SurahDetailsScreenState createState() => SurahDetailsScreenState();
}

class SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Al-Fatiha",
      ),
    );
  }
}
