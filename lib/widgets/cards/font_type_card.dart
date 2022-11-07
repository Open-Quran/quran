import 'package:fabrikod_quran/constants/extensions.dart';
import 'package:fabrikod_quran/constants/padding.dart';
import 'package:flutter/material.dart';

class FontTypeCard extends StatefulWidget {
  final String text;

  const FontTypeCard({Key? key, required this.text})
      : super(key: key);

  @override
  State<FontTypeCard> createState() => _FontTypeCardState();
}

class _FontTypeCardState extends State<FontTypeCard> {
  bool isExpanded = false;

  void changeExpanded(bool value) {
    setState(() => isExpanded = value);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kPaddingDefault),
        child: ExpansionTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.start,
                style: context.theme.textTheme.headlineSmall,
              ),
              
            ],
          ),
          onExpansionChanged: changeExpanded,
          backgroundColor: context.theme.cardTheme.color?.withOpacity(0.1),
          collapsedBackgroundColor:
              context.theme.cardTheme.color?.withOpacity(0.1),
          childrenPadding: const EdgeInsets.only(bottom: kPaddingDefault),
        ),
      ),
    );
  }
}
