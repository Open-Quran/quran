import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class JuzCard extends StatelessWidget {
  final int index;
  final Function(int selectedJuzIndex) onTap;

  const JuzCard({Key? key, required this.index, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      child: Card(
        color: context.theme.cardTheme.color?.withOpacity(0.1),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kPaddingDefault),
          ),
        ),
        child: Center(
          child: Text(
            (index + 1).toString(),
            textAlign: TextAlign.center,
            style: context.theme.textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
