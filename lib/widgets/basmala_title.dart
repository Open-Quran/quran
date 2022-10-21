import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

class BasmalaTitle extends StatelessWidget {
  const BasmalaTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Sonra gelecek data",
            style: context.theme.textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
