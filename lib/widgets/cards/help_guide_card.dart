import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

class HelpGuideCard extends StatefulWidget {
  final String text;
  final String description;

  const HelpGuideCard({Key? key, required this.text, required this.description})
      : super(key: key);

  @override
  State<HelpGuideCard> createState() => _HelpGuideCardState();
}

class _HelpGuideCardState extends State<HelpGuideCard> {
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
              Flexible(
                child: Text(
                  widget.text,
                  style: context.theme.textTheme.headlineSmall,
                ),
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
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: kSizeXL),
              child: Text(
                widget.description,
                style: context.theme.textTheme.bodySmall,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
