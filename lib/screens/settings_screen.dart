import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/screens/help_guide_screen.dart';
import 'package:fabrikod_quran/screens/language_screen.dart';
import 'package:fabrikod_quran/screens/references_screen.dart';
import 'package:fabrikod_quran/widgets/app_bars/primary_app_bar.dart';
import 'package:fabrikod_quran/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          appBar: PrimaryAppBar(
            title: context.translate.theOpenQuran,
          ),
          body: buildBody,
        ),
        buildAppInfo,
      ],
    );
  }

  Widget get buildBody {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: kSizeL, horizontal: kSizeXL),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              context.translate.settings,
              style: context.theme.textTheme.displayLarge,
            ),
          ),

          /// ToDo: Uncomment for release
          // CustomExpandingThemeCard(
          //   defaultThemeMode:
          //       context.watch<AppSettingsProvider>().appThemeMode,
          //   changedTheme: (newThemeMode) => context
          //       .read<AppSettingsProvider>()
          //       .changeAppTheme(newThemeMode),
          // ),
          // CustomLanguageCard(
          //   defaultLocale: context.watch<AppSettingsProvider>().appLocale,
          //   changedLocale: context.read<MoreProvider>().changeAppLanguage,
          // ),
          SecondaryButton(
            text: context.translate.language,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageScreen(),
                  ));
            },
            icon: SvgPicture.asset(
              ImageConstants.languageIcon,
              color: AppColors.white,
            ),
          ),
          SecondaryButton(
              text: context.translate.helpGuide,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpGuideScreen(),
                    ));
              },
              icon: SvgPicture.asset(
                ImageConstants.helpGuideIcon,
                color: AppColors.white,
              )),

          /// ToDo: Uncomment for release
          // SecondaryButton(
          //   text: context.translate.introduction,
          //   onPressed: () {},
          //   icon: SvgPicture.asset(
          //     ImageConstants.introductionIcon,
          //     color: AppColors.white,
          //   ),
          // ),
          // SecondaryButton(
          //   text: context.translate.shareApp,
          //   onPressed: () async {
          //     const appUrl = 'the store link of app will be here';
          //     await Share.share('Download Quran App \n\n $appUrl');
          //   },
          //   icon: SvgPicture.asset(
          //     ImageConstants.shareAppIcon,
          //     color: AppColors.white,
          //   ),
          // ),
          SecondaryButton(
              text: context.translate.references,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReferencesScreen(),
                    ));
              },
              icon: SvgPicture.asset(
                ImageConstants.referencesIcon,
                color: AppColors.white,
              )),

          /// ToDo: Uncomment for release
          // Container(
          //   padding: const EdgeInsets.only(top: kSizeXXL),
          //   alignment: Alignment.topLeft,
          //   child: Text(
          //     context.translate.rate,
          //     style: context.theme.textTheme.displayLarge,
          //   ),
          // ),
          // SecondaryButtonRate(
          //   text: context.translate.writeAnAppStoreReview,
          //   onPressed: () {
          //     context.read<MoreProvider>().onPressRate();
          //   },
          //   icon: const Text(
          //     '❤',
          //     style: TextStyle(fontSize: 18),
          //   ),
          //   endIcon: SvgPicture.asset(ImageConstants.arrowRight),
          // ),
        ],
      ),
    );
  }

  Widget get buildAppInfo {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        return Opacity(
          opacity: 0.24,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "${context.translate.madeByFabrikod} ${context.translate.version} ${snapshot.data?.version ?? ""}",
              style: context.theme.textTheme.headlineSmall,
            ),
          ),
        );
      },
    );
  }
}
