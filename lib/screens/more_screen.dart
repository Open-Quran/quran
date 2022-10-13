import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/app_settings_provider.dart';
import 'package:fabrikod_quran/screens/surah_details_screen.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context
                  .read<AppSettingsProvider>()
                  .changeAppTheme(EThemeModes.light);
            },
            child: const Text("Light Theme"),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<AppSettingsProvider>()
                  .changeAppTheme(EThemeModes.dark);
            },
            child: const Text("Dark Theme"),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<AppSettingsProvider>()
                  .changeAppTheme(EThemeModes.quran);
            },
            child: const Text("Kuran Theme"),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<AppSettingsProvider>()
                  .changeAppTheme(EThemeModes.green);
            },
            child: const Text("Green Theme"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SurahDetailsScreen()));
            },
            child: const Text("Surah details"),
          ),
        ],
      ),
    );
  }
}
