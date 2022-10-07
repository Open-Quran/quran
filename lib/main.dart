import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:fabrikod_quran/provider/settings_provider.dart';
import 'package:fabrikod_quran/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  await GetStorage.init('FabrikodQuran');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<SettingsProvider>(
        builder: (context, settingProvider, child) {
          return MaterialApp(
            title: 'Fabrikod Quran',
            debugShowCheckedModeBanner: false,
            locale: settingProvider.appLocale,
            localizationsDelegates: TranslateHelper.localizationsDelegates,
            supportedLocales: TranslateHelper.supportedLocales,
            localeResolutionCallback: TranslateHelper.localeResolutionCallback,
            theme: themeLight,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }

  List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => SettingsProvider()),
    ];
  }
}
