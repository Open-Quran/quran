import 'package:fabrikod_quran/constants/constants.dart';
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
          contentPadding: const EdgeInsets.all(kPaddingHorizontal),
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

  OutlineInputBorder get getBorder {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(kPaddingDefault)),
      borderSide: BorderSide.none,
    );
  }
}
