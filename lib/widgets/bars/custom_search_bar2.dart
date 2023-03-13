import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../../providers/search_provider.dart';

class CustomSearchBar2 extends StatelessWidget {
  final TextEditingController? textEditingController;
  final GlobalKey? formKey;
  final FocusNode? focusNode;
  final void Function(String) onSubmit;

  const CustomSearchBar2({
    Key? key,
    this.textEditingController,
    this.formKey,
    this.focusNode,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildInput(context);
  }

  Widget buildInput(BuildContext context) {
    TextEditingController textController =
        context.read<SearchProvider>().textEditingController;

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color?.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(kSizeM)),
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
          contentPadding: const EdgeInsets.all(kSizeXL),
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
      borderRadius: BorderRadius.all(Radius.circular(kSizeM)),
      borderSide: BorderSide.none,
    );
  }
}
