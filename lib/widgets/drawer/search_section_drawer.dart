import 'package:flutter/material.dart';
import 'package:the_open_quran/constants/constants.dart';

class SearchSectionDrawer extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  const SearchSectionDrawer(
      {Key? key, required this.hintText, this.focusNode, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: context.theme.toggleButtonsTheme.selectedColor,
        borderRadius: BorderRadius.circular(kSizeM),
      ),
      child: Opacity(
        opacity: 0.5,
        child: Center(
          child: TextField(
            focusNode: focusNode,
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: context.theme.toggleButtonsTheme.textStyle?.color,
            style: context.theme.toggleButtonsTheme.textStyle,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              hintStyle: context.theme.toggleButtonsTheme.textStyle,
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
