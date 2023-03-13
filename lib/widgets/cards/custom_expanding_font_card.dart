import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

class CustomExpandingFontCard extends StatefulWidget {
  final String title;
  final String defaultFont;
  final List<String> fonts;
  final Function(String newFont) changedFont;

  const CustomExpandingFontCard(
      {Key? key,
      required this.title,
      required this.defaultFont,
      required this.changedFont,
      required this.fonts})
      : super(key: key);

  @override
  State<CustomExpandingFontCard> createState() => _CustomExpandingFontCard();
}

class _CustomExpandingFontCard extends State<CustomExpandingFontCard> {
  bool isExpanded = false;

  void changeExpanded(bool value) {
    setState(() => isExpanded = value);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kSizeM),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: context.theme.textTheme.headlineSmall,
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
          childrenPadding: const EdgeInsets.only(bottom: kSizeM),
          children: <Widget>[
            ...widget.fonts.map(
              (e) => ListTile(
                onTap: () => widget.changedFont(e),
                visualDensity: const VisualDensity(vertical: -2),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: kSizeM * 3),
                dense: true,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      widget.defaultFont == e
                          ? ImageConstants.checkboxActiveIcon
                          : ImageConstants.checkboxInactiveIcon,
                      height: 25,
                      width: 25,
                      color: context.theme.iconTheme.color,
                    ),
                    const SizedBox(width: kSizeL),
                    Text(e, style: context.theme.textTheme.titleMedium),
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
