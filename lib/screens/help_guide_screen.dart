import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/help_guide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HelpGuideScreen extends StatefulWidget {
  const HelpGuideScreen({super.key});

  @override
  State<HelpGuideScreen> createState() => _HelpGuideScreenState();
}

class _HelpGuideScreenState extends State<HelpGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildBody,
    );
  }

  PreferredSizeWidget get buildAppBar {
    return MainAppBar(
      title: context.translate.helpGuide,
      leading: IconButton(
        icon: SvgPicture.asset(ImageConstants.arrowBack),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget get buildBody {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: kPaddingHorizontal,
        vertical: kPaddingVertical,
      ),
      child: Column(
        children: [
          HelpGuideCard(
            text: context.translate.helpGuideTitle1,
            description: context.translate.helpGuideDescription1,
          ),
          const SizedBox(height: kPaddingDefault),
          HelpGuideCard(
            text: context.translate.helpGuideTitle1,
            description: context.translate.helpGuideDescription1,
          ),
          const SizedBox(height: kPaddingDefault),
          HelpGuideCard(
            text: context.translate.helpGuideTitle1,
            description: context.translate.helpGuideDescription1,
          ),
          const SizedBox(height: kPaddingDefault),
          HelpGuideCard(
            text: context.translate.helpGuideTitle1,
            description: context.translate.helpGuideDescription1,
          ),
          const SizedBox(height: kPaddingDefault),
          HelpGuideCard(
            text: context.translate.helpGuideTitle1,
            description: context.translate.helpGuideDescription1,
          ),
          const SizedBox(height: kPaddingDefault * 5),
          buildAppInfoHelpGuide,
          const SizedBox(height: kPaddingDefault * 5)
        ],
      ),
    );
  }

  /// App Version
  Widget get buildAppInfoHelpGuide {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.translate.madeByFabrikod, style: context.theme.textTheme.headlineSmall),
        const SizedBox(height: kPaddingSmall),
        FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, snapshot) {
            return Text(
              "${context.translate.version}  ${snapshot.data?.version ?? ""}",
              style: context.theme.textTheme.bodyMedium,
            );
          },
        ),
      ],
    );
  }
}
