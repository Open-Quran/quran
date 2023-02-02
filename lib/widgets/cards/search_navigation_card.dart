import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchNavigationCard extends StatelessWidget {
  /// The number of the page or juz
  final String? titleNumber;

  /// Card title
  final String title;

  /// Function onTap
  final Function() onTap;

  /// Constructor
  const SearchNavigationCard(
      {Key? key, this.titleNumber, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: kPaddingL),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPaddingM),
            color: AppColors.black2),
        child: Row(
          children: [
            const SizedBox(width: kPaddingXL),
            Visibility(child: Expanded(child: navigationTitle(context))),
            const SizedBox(width: kPaddingL),
          ],
        ),
      ),
    );
  }

  /// Number of juz or page
  Widget navigationTitle(BuildContext context) {
    return Text(
      titleNumber ?? '',
      overflow: TextOverflow.ellipsis,
      style: context.theme.toggleButtonsTheme.textStyle,
    );
  }
}
