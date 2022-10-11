import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:fabrikod_quran/provider/app_settings_provider.dart';
import 'package:fabrikod_quran/screens/bottom_nav_bar_screen.dart';
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
      child: Consumer<AppSettingsProvider>(
        builder: (context, appSettingProvider, child) {
          return MaterialApp(
            title: "Fabrikod Qur'an",
            debugShowCheckedModeBanner: false,
            locale: appSettingProvider.appLocale,
            localizationsDelegates: TranslateHelper.localizationsDelegates,
            supportedLocales: TranslateHelper.supportedLocales,
            localeResolutionCallback: TranslateHelper.localeResolutionCallback,
            theme: appSettingProvider.appThemeData,
            home: const BottomNavBarScreen(),
          );
        },
      ),
    );
  }

  /// Create App Global Providers
  List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => AppSettingsProvider()),
    ];
  }
}
