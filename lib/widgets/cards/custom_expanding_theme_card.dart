import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/enums.dart';

class CustomExpandingThemeCard extends StatefulWidget {
  final EThemeModes defaultThemeMode;
  final Function(EThemeModes newThemeMode) changedTheme;

  const CustomExpandingThemeCard(
      {Key? key, required this.defaultThemeMode, required this.changedTheme})
      : super(key: key);

  @override
  State<CustomExpandingThemeCard> createState() =>
      _CustomExpandingThemeCardState();
}

class _CustomExpandingThemeCardState extends State<CustomExpandingThemeCard> {
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
          title: Row(
            children: [
              SvgPicture.asset(
                ImageConstants.themeIcon,
                height: 25,
                width: 25,
                color: context.theme.iconTheme.color,
              ),
              const SizedBox(width: kSizeL),
              Text(
                context.translate.switchTheme,
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
          childrenPadding: const EdgeInsets.only(bottom: kSizeM),
          children: <Widget>[
            ...EThemeModes.values.map(
              (e) => ListTile(
                onTap: () => widget.changedTheme(e),
                visualDensity: const VisualDensity(vertical: -2),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: kSizeM * 3),
                dense: true,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      widget.defaultThemeMode == e
                          ? ImageConstants.checkboxActiveIcon
                          : ImageConstants.checkboxInactiveIcon,
                      height: 25,
                      width: 25,
                      color: context.theme.iconTheme.color,
                    ),
                    const SizedBox(width: kSizeL),
                    Text(
                      e.name(context),
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
