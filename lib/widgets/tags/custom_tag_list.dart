import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 35,
      child: ListView.separated(
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildButton(context, tag: tags[index]),
        separatorBuilder: (context, index) => const SizedBox(width: kPaddingDefault),
      ),
    );
  }

  Widget buildButton(BuildContext context, {required String tag}) {
    return ElevatedButton(
      onPressed: () => selectedTag(tag),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(kPaddingDefault),
        backgroundColor: context.theme.cardTheme.color?.withOpacity(0.1),
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kPaddingDefault / 2),
        ),
      ),
      child: Text(
        tag,
        style: context.theme.textTheme.bodyLarge?.copyWith(
          color: context.theme.secondaryHeaderColor,
        ),
      ),
    );
  }
}
