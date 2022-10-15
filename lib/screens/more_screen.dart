import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/screens/surah_details_screen.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/custom_expanding_theme_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.translate.more,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingVertical,
          horizontal: kPaddingHorizontal,
        ),
        child: Column(
          children: [
            CustomExpandingThemeCard(
              defaultThemeMode: context.watch<AppSettingsProvider>().appThemeMode,
              changedTheme: (newThemeMode) =>
                  context.read<AppSettingsProvider>().changeAppTheme(newThemeMode),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SurahDetailsScreen()));
              },
              child: const Text("Surah details"),
            ),
          ],
        ),
      ),
    );
  }
}
