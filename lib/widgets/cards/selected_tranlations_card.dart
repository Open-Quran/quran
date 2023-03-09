import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../models/translation.dart';

class SelectedTranslationsCard extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final List<TranslationAuthor> activeTranslations;

  const SelectedTranslationsCard(
      {Key? key, this.text, this.onTap, required this.activeTranslations})
      : super(key: key);

  String title(BuildContext context) {
    if (activeTranslations.length == 1) {
      return activeTranslations.first.translationName ?? "";
    }
    return "${activeTranslations.first.translationName} ${context.translate.and} +${activeTranslations.length - 1}";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kSizeM),
      child: Container(
        constraints: const BoxConstraints(minHeight: 70),
        padding: const EdgeInsets.all(kSizeM),
        decoration: BoxDecoration(
          color: context.theme.cardTheme.color?.withOpacity(0.1),
          borderRadius: BorderRadius.circular(kSizeM),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title(context),
                style: context.theme.textTheme.headlineSmall,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(kSizeM),
              child: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
