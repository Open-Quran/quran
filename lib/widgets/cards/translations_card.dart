import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/images.dart';
import '../../constants/padding.dart';
import '../../providers/quran_provider.dart';
import '../custom_space.dart';

class TranslationsCard extends StatelessWidget {
  final Function() onBack;

  const TranslationsCard({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context
          .watch<QuranProvider>()
          .translationService
          .allTranslationCountry
          .length,
      itemBuilder: (context, index) {
        var allTranslation = context
            .read<QuranProvider>()
            .translationService
            .allTranslationCountry;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBack,
            ),
            Text(allTranslation[index].name ?? "",
                style: context.theme.appBarTheme.titleTextStyle),
            CustomSpace.normal(),
            ...allTranslation[index].translationsAuthor.map(
                  (e) => ListTile(
                    // onTap: () => context.read<QuranProvider>().selectedTranslation(e.resourceId),
                    visualDensity: const VisualDensity(vertical: -2),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: kSizeM * 2),
                    dense: true,
                    title: Row(
                      children: [
                        SvgPicture.asset(
                          e.isTranslationSelected
                              ? ImageConstants.checkboxActiveIcon
                              : ImageConstants.checkboxInactiveIcon,
                          height: 25,
                          width: 25,
                          color: context.theme.iconTheme.color,
                        ),
                        const SizedBox(width: kSizeL),
                        Expanded(
                          child: Text(
                            e.translationName ?? "",
                            style: context.theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
          ],
        );
      },
    );
  }
}
