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



//....ADD ITEM TEXT FIELD
class AddItemTextField extends StatelessWidget {
  const AddItemTextField(
      {super.key,
      required this.hintAndLabelText,
      required this.keyboardType,
      required this.validator,
      required this.textEditingController});
  final String hintAndLabelText;
  final TextInputType keyboardType;
  final FormFieldValidator<String?> validator;
  final TextEditingController textEditingController;
  //.....CONSTANT VALUES
  static const _fieldWidth = 0.9;
  static const _fontSize = 0.2;
  //....FIELD DECORATION
  static final _border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.grayColor,
      ),
      borderRadius: BorderRadius.circular(10.0));
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxWidth, :maxHeight) = constraints;
        final textStyle = TextStyle(
          color: AppColors.grayColor,
          fontSize: maxHeight * _fontSize,
        );
        return SizedBox(
          width: maxWidth * _fieldWidth,
          child: TextFormField(
            controller: textEditingController,
            validator: validator,
            style: textStyle,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              hintText: hintAndLabelText,
              hintStyle: textStyle,
            ),
          ),
        );
      },
    );
  }
}