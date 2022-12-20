import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

/// Search suggestions
const List<String> searchSuggestions = [
  "18",
  "Ya-sin",
  "الفاتحة",
  "Madinah",
  "الملك",
  "112",
  "Maryam"
];

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? textEditingController;
  final GlobalKey? formKey;
  final FocusNode? focusNode;
  final void Function(String) onSubmit;

  const CustomSearchBar(
      {Key? key,
      this.textEditingController,
      this.formKey,
      this.focusNode,
      required this.onSubmit,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Autocomplete<String>(
        displayStringForOption: (data) => data,
        onSelected: onSubmit,
        optionsBuilder: _getSuggestions,
        optionsViewBuilder: (context, onSelected, results) =>
            _buildSuggestionsView(context, onSelected, results, constraints),
        fieldViewBuilder: _buildInput,
      ),
    );
  }

  /// Suggestion title
  Widget _buildSuggestionTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).copyWith(top: 0),
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: context.theme.cardTheme.color!.withOpacity(0.1)))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.translate.suggestions,
          overflow: TextOverflow.ellipsis,
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          style: context.theme.textTheme.headlineSmall,
        ),
      ),
    );
  }

  Widget _buildSuggestion(
      BuildContext context, String suggestion, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            suggestion,
            overflow: TextOverflow.ellipsis,
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
            style: context.theme.textTheme.titleSmall,
          ),
        ),
      ),
    );
  }

  /// Suggestions view
  Widget _buildSuggestionsView(BuildContext context, onSelected,
      Iterable<String> results, BoxConstraints constraints) {
    List<Widget> items = results
        .map((str) => _buildSuggestion(context, str, () => onSelected(str)))
        .toList();
    items.insert(0, _buildSuggestionTitle(context));

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        width: constraints.maxWidth,
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.theme.dividerColor,
              blurRadius: 4,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              children: items,
            ),
          ),
        ),
      ),
    );
  }

  /// All search suggestions
  Iterable<String> _getSuggestions(TextEditingValue textEditingValue) {
    if (textEditingValue.text == '') {
      return searchSuggestions.getRange(0, 5);
    }

    return searchSuggestions.where((str) {
      return str.startsWith(textEditingValue.text.toLowerCase());
    }).toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }

  Widget _buildInput(BuildContext context, TextEditingController textController,
      FocusNode focusNode, _) {

    context.read<SearchProvider>().textEditingController = textController;
    context.read<SearchProvider>().searchBarFocusNode = focusNode;

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color?.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(kPaddingM)),
      ),
      child: Row(children: [
        const Gap(8 * 1.5),
        Icon(Icons.search, color: context.theme.secondaryHeaderColor),
        Expanded(
          child: TextField(
            onSubmitted: onSubmit,
            controller: textController,
            focusNode: focusNode,
            style: TextStyle(color: context.theme.secondaryHeaderColor),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              labelStyle: TextStyle(color: context.theme.secondaryHeaderColor),
              hintStyle: TextStyle(
                  color: context.theme.secondaryHeaderColor.withOpacity(0.5)),
              prefixStyle: TextStyle(color: context.theme.secondaryHeaderColor),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              hintText: context.translate.search,
            ),
          ),
        ),
        const Gap(8),
        ValueListenableBuilder(
          valueListenable: textController,
          builder: (_, value, __) => Visibility(
            visible: textController.value.text.isNotEmpty,
            child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    textController.clear();
                    onSubmit('');
                  },
                )),
          ),
        )
      ]),
    );
  }

  /// Search form
  Form buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        focusNode: focusNode,
        controller: textEditingController,
        cursorColor: context.theme.primaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: context.theme.secondaryHeaderColor,
          ),
          fillColor: context.theme.cardTheme.color?.withOpacity(0.1),
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(kPaddingXL),
          border: getBorder,
          errorBorder: getBorder,
          disabledBorder: getBorder,
          enabledBorder: getBorder,
          focusedBorder: getBorder,
          focusedErrorBorder: getBorder,
          labelText: context.translate.search,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: context.theme.textTheme.titleSmall?.copyWith(
            color: context.theme.secondaryHeaderColor,
          ),
        ),
      ),
    );
  }

  /// Border
  OutlineInputBorder get getBorder {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(kPaddingM)),
      borderSide: BorderSide.none,
    );
  }
}
