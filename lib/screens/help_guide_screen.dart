import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/cards/help_guide_card.dart';

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
    return PrimaryAppBar(
      title: context.translate.theOpenQuran,
      leading: IconButton(
        icon: SvgPicture.asset(ImageConstants.newBackArrow),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget get buildBody {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: kSizeXL,
        vertical: kSizeXXL,
      ),
      child: Column(
        children: <Widget>[
          HelpGuideCard(
            text: context.translate.helpGuideTitle1,
            description: context.translate.helpGuideDescription1,
          ),
          const SizedBox(height: kSizeM),
          HelpGuideCard(
            text: context.translate.helpGuideTitle2,
            description: context.translate.helpGuideDescription2,
          ),
          const SizedBox(height: kSizeM),
          HelpGuideCard(
            text: context.translate.helpGuideTitle3,
            description: context.translate.helpGuideDescription3,
          ),
          const SizedBox(height: kSizeM),
          HelpGuideCard(
            text: context.translate.helpGuideTitle4,
            description: context.translate.helpGuideDescription4,
          ),
          const SizedBox(height: kSizeM),
          HelpGuideCard(
            text: context.translate.helpGuideTitle5,
            description: context.translate.helpGuideDescription5,
          ),
          HelpGuideCard(
            text: context.translate.helpGuideTitle6,
            description: context.translate.helpGuideDescription6,
          ),
          HelpGuideCard(
            text: context.translate.helpGuideTitle7,
            description: context.translate.helpGuideDescription7,
          ),
          HelpGuideCard(
            text: context.translate.helpGuideTitle8,
            description: context.translate.helpGuideDescription8,
          ),
          HelpGuideCard(
            text: context.translate.helpGuideTitle9,
            description: context.translate.helpGuideDescription9,
          ),
          const SizedBox(height: kSizeM * 5),
          buildAppInfoHelpGuide,
          const SizedBox(height: kSizeM * 5)
        ],
      ),
    );
  }

  /// App Version
  Widget get buildAppInfoHelpGuide {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.translate.madeByFabrikod,
            style: context.theme.textTheme.headlineSmall),
        const SizedBox(height: kSizeS),
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
