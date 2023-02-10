import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/empty_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/translations_setting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TranslationSettingScreen extends StatefulWidget {
  const TranslationSettingScreen({super.key});

  @override
  State<TranslationSettingScreen> createState() =>
      _TranslationSettingScreenState();
}

class _TranslationSettingScreenState extends State<TranslationSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(
        title: context.translate.selectedTranslation,
        leading: IconButton(
          icon: SvgPicture.asset(ImageConstants.newBackArrow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: buildBody,
      ),
    );
  }

  Widget get buildBody {
    return Column(
      children: [
        buildDownloaded(),
        buildDownloaded(),
        buildDownloaded(),
        buildDownloaded(),
      ],
    );
  }

  Widget buildDownloaded() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kSizeL, vertical: kSizeL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS),
            child: Text(
              context.translate.downloaded,
              style: context.theme.textTheme.bodyMedium!
                  .copyWith(color: AppColors.white.withOpacity(0.5)),
            ),
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSizeS, vertical: kSizeL),
            child: Text(
              context.translate.arabic,
              style: context.theme.textTheme.headlineSmall!
                  .copyWith(color: AppColors.white.withOpacity(0.5)),
            ),
          ),
          const TranslationsSettingCard(),
          const SizedBox(height: kSizeM),
          const TranslationsSettingCard(),
          const SizedBox(height: kSizeM),
          const TranslationsSettingCard(),
        ],
      ),
    );
  }
}
