import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';
import '../providers/app_settings_provider.dart';
import '../providers/more_provider.dart';
import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/cards/custom_language_card.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider<MoreProvider>(
      create: (_) => MoreProvider(context),
      child: Scaffold(
        appBar: buildAppBar,
        body: buildBody,
      ),
    );
  }

  Widget get buildBody {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSizeL, horizontal: kSizeXL),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                context.translate.language,
                style: context.theme.textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 30),
            CustomLanguageCard(
              defaultLocale: context.watch<AppSettingsProvider>().appLocale,
              changedLocale: context.read<AppSettingsProvider>().changeAppLanguage,
            ),
          ],
        ),
      ),
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
}
