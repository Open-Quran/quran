import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../constants/colors.dart';
import '../../constants/padding.dart';

class CustomTagList extends StatelessWidget {
  final List<String> tags;
  final Function(String) selectedTag;

  const CustomTagList({
    Key? key,
    required this.tags,
    required this.selectedTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: kSizeL),
        height: 45,
        child: Wrap(
          spacing: kSizeL,
          children: List.generate(
              tags.length, (index) => buildButton(context, tag: tags[index])),
        ));
  }

  Widget buildButton(BuildContext context, {required String tag}) {
    return ElevatedButton(
      onPressed: () => selectedTag(tag),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(kSizeM),
        backgroundColor: AppColors.black10,
        foregroundColor: context.theme.cardTheme.color,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        tag,
        style: context.theme.textTheme.titleMedium?.copyWith(
          color: context.theme.secondaryHeaderColor,
        ),
      ),
    );
  }
}
