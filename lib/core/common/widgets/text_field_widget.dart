//dismiss the keyboard
import 'dart:math';

import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';

extension DismissKeyboard on BuildContext {
  void dismissKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

class DataCollectionTextFormField extends StatelessWidget {
  const DataCollectionTextFormField(
      {super.key,
      required this.hintAndLabelText,
      required this.keyboardType,
      required this.validator,
      required this.textEditingController,
      this.isReadOnly = false,
      this.isHintTextBold = false,
      this.onTab,
      this.focusNode});
  final String hintAndLabelText;
  final TextInputType keyboardType;
  final FormFieldValidator<String?> validator;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final bool isReadOnly;
  final VoidCallback? onTab;
  final bool isHintTextBold;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    var screenRatio = min(width, height);
    return TextFormField(
      onTap: onTab,
      onTapOutside: (event) {
        context.dismissKeyboard();
      },
      controller: textEditingController,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.greenColor,
      cursorRadius: Radius.circular(screenRatio),
      readOnly: isReadOnly,
      decoration: InputDecoration(
        errorMaxLines: 1,
        isDense: true,
        hintText: hintAndLabelText,
        hintStyle: TextStyle(
            color: AppColors.grayColor,
            fontWeight:
                isHintTextBold == false ? FontWeight.w300 : FontWeight.bold),
        helperText: 'required',
        helperStyle: const TextStyle(color: AppColors.grayColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              screenRatio * 0.04,
            ),
            borderSide: const BorderSide(color: AppColors.grayColor, width: 2)),
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              screenRatio * 0.04,
            ),
            borderSide: const BorderSide(
              color: AppColors.grayColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              screenRatio * 0.04,
            ),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            )),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            screenRatio * 0.04,
          ),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error, width: 1.5),
        ),
      ),
    );
  }
}
