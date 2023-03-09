import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/quran_provider.dart';
import '../title.dart';

class TranslationBox extends StatelessWidget {
  final Function() onTap;

  const TranslationBox({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          titleText: context.translate.translation,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: Utils.isSmallPhone(context) ? 45 : 50,
            margin: const EdgeInsets.only(top: kSizeM, bottom: kSizeXXL),
            padding: const EdgeInsets.all(kSizeM),
            decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    context
                            .watch<QuranProvider>()
                            .translationService
                            .translationButtonName ??
                        context.translate.translation,
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                SvgPicture.asset(ImageConstants.dropDownIcon)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
