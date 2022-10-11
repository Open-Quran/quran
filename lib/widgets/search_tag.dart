import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchTag extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const SearchTag({Key? key, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(kPaddingDefault),
        backgroundColor: Theme.of(context).cardTheme.color?.withOpacity(0.1),
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kPaddingDefault / 2),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).secondaryHeaderColor,
            ),
      ),
    );
  }
}
