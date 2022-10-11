import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/l10n/translate_helper.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? textEditingController;
  final GlobalKey? formKey;
  final FocusNode? focusNode;

  const CustomSearchBar({Key? key, this.textEditingController, this.formKey, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        focusNode: focusNode,
        controller: textEditingController,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          fillColor: Theme.of(context).cardTheme.color?.withOpacity(0.1),
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(kPaddingHorizontal),
          border: getBorder,
          errorBorder: getBorder,
          disabledBorder: getBorder,
          enabledBorder: getBorder,
          focusedBorder: getBorder,
          focusedErrorBorder: getBorder,
          labelText: TranslateHelper.of(context)?.search ?? "",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Theme.of(context).secondaryHeaderColor,
              ),
        ),
      ),
    );
  }

  OutlineInputBorder get getBorder {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(kPaddingDefault)),
      borderSide: BorderSide.none,
    );
  }
}
