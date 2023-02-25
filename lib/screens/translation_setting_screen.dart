import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/translation.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/widgets/app_bars/empty_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/translations_setting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TranslationSettingScreen extends StatefulWidget {
  const TranslationSettingScreen({super.key});

  @override
  State<TranslationSettingScreen> createState() => _TranslationSettingScreenState();
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
      body: buildBody,
    );
  }

  Widget get buildBody {
    var translationCountries =
        context.watch<QuranProvider>().translationService.allTranslationCountry;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTitle(context.translate.downloaded),
          buildDownloadList(translationCountries),
          buildTitle(context.translate.availableToDownload),
          buildDownloadedList(translationCountries),
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: kSizeL, right: kSizeL, top: kSizeL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.theme.textTheme.bodyMedium!
                .copyWith(color: AppColors.white.withOpacity(0.5)),
          ),
          Divider(color: Theme.of(context).canvasColor),
        ],
      ),
    );
  }

  Widget buildDownloadList(List<TranslationCountry> translationCountries) {
    return ListView.builder(
      itemCount: translationCountries.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildDownloaded(translationCountries.elementAt(index), false);
      },
    );
  }

  Widget buildDownloadedList(List<TranslationCountry> translationCountries) {
    return ListView.builder(
      itemCount: translationCountries.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildDownloaded(translationCountries.elementAt(index), true);
      },
    );
  }

  Widget buildDownloaded(TranslationCountry translationCountry, bool isDownload) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSizeL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS, vertical: kSizeL),
            child: Text(
              translationCountry.name ?? "",
              style: context.theme.textTheme.headlineSmall!
                  .copyWith(color: AppColors.white.withOpacity(0.5)),
            ),
          ),
          ListView.separated(
            itemCount: translationCountry.translationsAuthor.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var value = translationCountry.translationsAuthor.elementAt(index);
              bool control = false;
              if (isDownload) {
                control = value.verseTranslationState != EVerseTranslationState.downloaded;
              } else {
                control = value.verseTranslationState == EVerseTranslationState.downloaded;
              }
              if (control) {
                return TranslationsSettingCard(
                  translationAuthor: value,
                  onTap: context.read<QuranProvider>().onTapTranslationAuthorCard,
                );
              } else {
                return const SizedBox();
              }
            },
            separatorBuilder: (context, index) {
              var value = translationCountry.translationsAuthor.elementAt(index);
              bool control = false;
              if (isDownload) {
                control = value.verseTranslationState != EVerseTranslationState.downloaded;
              } else {
                control = value.verseTranslationState == EVerseTranslationState.downloaded;
              }
              return control ? const SizedBox(height: kSizeM) : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
