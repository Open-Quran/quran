import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/buttons/secondary_button.dart';
import 'package:fabrikod_quran/widgets/cards/custom_expanding_theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          horizontal: kPaddingHorizontal,
          vertical: kPaddingVertical,
        ),
        child: Column(
          children: [
            SecondaryButton(
              text: context.translate.favorited,
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: ColorConstants.purple,
              ),
            ),
            const SizedBox(
              height: kPaddingDefault,
            ),
            SecondaryButton(
              text: context.translate.language,
              onPressed: () {},
              icon: SvgPicture.asset(
                  ImageConstants.languageIcon,
                  color: context.theme.iconTheme.color,
                )
            ),
            const SizedBox(
              height: kPaddingDefault,
            ),
            SecondaryButton(
              text: context.translate.helpGuide,
              onPressed: () {},
              icon: SvgPicture.asset(
                  ImageConstants.helpGuideIcon,
                  color: context.theme.iconTheme.color,
                )
            ),
            const SizedBox(
              height: kPaddingDefault,
            ),
            SecondaryButton(
                text: context.translate.introduction,
                onPressed: () {},
                icon: SvgPicture.asset(
                  ImageConstants.introductionIcon,
                  color: context.theme.iconTheme.color,
                )),
            const SizedBox(
              height: kPaddingDefault,
            ),
            SecondaryButton(
                text: context.translate.shareApp,
                onPressed: () {},
                icon: SvgPicture.asset(
                  ImageConstants.shareAppIcon,
                  color: context.theme.iconTheme.color,
                )),
            const SizedBox(
              height: kPaddingDefault,
            ),
            SecondaryButton(
                text: context.translate.references,
                onPressed: () {},
                icon: SvgPicture.asset(
                  ImageConstants.referencesIcon,
                  color: context.theme.iconTheme.color,
                )),
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
