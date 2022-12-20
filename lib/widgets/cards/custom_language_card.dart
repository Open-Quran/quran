import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLanguageCard extends StatefulWidget {
  final Locale? defaultLocale;
  final Function(String newLocale) changedLocale;

  const CustomLanguageCard(
      {Key? key, required this.defaultLocale, required this.changedLocale})
      : super(key: key);

  @override
  State<CustomLanguageCard> createState() => _CustomLanguageCardState();
}

class _CustomLanguageCardState extends State<CustomLanguageCard> {
  bool isExpanded = false;

  void changeExpanded(bool value) {
    setState(() => isExpanded = value);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kPaddingM),
        child: ExpansionTile(
          title: Row(
            children: [
              SvgPicture.asset(
                ImageConstants.languageIcon,
                height: 25,
                width: 25,
                color: context.theme.iconTheme.color,
              ),
              const SizedBox(width: kPaddingL),
              Text(
                context.translate.language,
                style: context.theme.textTheme.headlineSmall,
              ),
            ],
          ),
          trailing: Icon(
            isExpanded
                ? Icons.arrow_drop_up_rounded
                : Icons.arrow_drop_down_rounded,
            size: 40,
            color: context.theme.iconTheme.color,
          ),
          onExpansionChanged: changeExpanded,
          backgroundColor: context.theme.cardTheme.color?.withOpacity(0.1),
          collapsedBackgroundColor:
              context.theme.cardTheme.color?.withOpacity(0.1),
          childrenPadding: const EdgeInsets.only(bottom: kPaddingM),
          children: <Widget>[
            ...ESupportedLanguage.values.map(
              (e) => ListTile(
                onTap: () => widget.changedLocale(e.name.toLowerCase()),
                visualDensity: const VisualDensity(vertical: -2),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: kPaddingM * 3),
                dense: true,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      widget.defaultLocale?.languageCode.toLowerCase() == e.name.toLowerCase()
                          ? ImageConstants.checkboxActiveIcon
                          : ImageConstants.checkboxInactiveIcon,
                      height: 25,
                      width: 25,
                      color: context.theme.iconTheme.color,
                    ),
                    const SizedBox(width: kPaddingL),
                    Text(
                      e.title(context),
                      style: context.theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
