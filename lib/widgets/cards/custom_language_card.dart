import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/enums.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...ESupportedLanguage.values.map(
          (e) => InkWell(
            onTap: () => widget.changedLocale(e.name.toLowerCase()),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.title(context),
                    style: context.theme.textTheme.titleLarge
                        ?.copyWith(color: AppColors.grey),
                  ),
                  widget.defaultLocale?.languageCode.toLowerCase() ==
                          e.name.toLowerCase()
                      ? Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white3),
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              ImageConstants.onSelectLetter,
                              height: 15,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
