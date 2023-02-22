import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/reading_settings_model.dart';
import 'package:fabrikod_quran/models/recent_model.dart';
import 'package:flutter/material.dart';

class RecentCard extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const RecentCard(
      {Key? key,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(kSizeM)),
      child: Card(
        color: AppColors.black4.withOpacity(0.47),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kSizeM)),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
