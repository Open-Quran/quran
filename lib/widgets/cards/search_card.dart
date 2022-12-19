import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/surah_model.dart';
import 'package:fabrikod_quran/widgets/number_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SearchCard extends StatelessWidget {
  /// The number of the page or juz
  final String? titleNumber;

  /// Card title
  final String title;

  /// Function onTap
  final Function() onTap;

  /// Constructor
  const SearchCard(
      {Key? key, this.titleNumber, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPaddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCardTitle(context),
            const Gap(10),
            Row(
              children: [
                Icon(
                  Icons.arrow_right_outlined,
                  size: 30,
                  color: context.theme.iconTheme.color,
                ),
                const SizedBox(width: kPaddingL),
                Visibility(child: Expanded(child: navigationTitle(context))),
                const SizedBox(width: kPaddingL),
              ],
            ),
            const SizedBox(height: kPaddingM),
            const Divider(thickness: 1, height: 1)
          ],
        ),
      ),
    );
  }

  /// Card title
  Padding buildCardTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPaddingM),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: context.theme.textTheme.headlineSmall,
      ),
    );
  }

  /// Number of juz or page
  Widget navigationTitle(BuildContext context) {
    return Text(
      titleNumber ?? '',
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.headlineMedium,
    );
  }
}
