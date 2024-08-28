//dismiss the keyboard
import 'dart:math';

import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension DismissKeyboard on BuildContext {
  void dismissKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

//....login and sigin textfield widget
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

//........USER PROFILE TEXTFIELD WIDGET
class ProfilePageTextFields extends StatelessWidget {
  const ProfilePageTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.isObscured = false,
    this.suffixIcon,
    required this.keyboardType,
  });
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String?> validator;
  final bool isObscured;
  final Icon? suffixIcon;
  final TextInputType keyboardType;
  //...CONSTANT VALUES
  static const _fieldWidth = 0.9;
  static const _fontSize = 0.023;
  //...DECORATION
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: AppColors.greenColor, width: 0.0),
  );
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: height * _fontSize,
    );
    return SizedBox(
      width: width * _fieldWidth,
      child: TextFormField(
        cursorColor: AppColors.blackColor,
        keyboardType: keyboardType,
        controller: controller,
        style: textStyle,
        validator: validator,
        obscureText: isObscured,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          fillColor: AppColors.lightGreenColor,
          filled: true,
          hintText: hintText,
          hintStyle: textStyle,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

//.....ADMIN SIDE TEXTFields
class AdminAppCompactTextField extends StatelessWidget {
  const AdminAppCompactTextField({
    super.key,
    this.fieldWidth = 0.9,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.expands = false,
    this.fieldHeight = 0.075,
    this.textAlignment,
    this.prefix,
    this.suffix,
    this.borderColor = AppColors.greenColor,
    this.fillColor = AppColors.lightGreenColor,
    this.borderWidth = 0.0,
    this.hintColor = AppColors.blackColor,
  });
  final bool expands;
  final FormFieldValidator validator;
  final double fieldWidth, fieldHeight, borderWidth;
  final TextEditingController controller;
  final String hintText;
  final TextAlignVertical? textAlignment;
  final Widget? prefix, suffix;
  final Color borderColor, fillColor, hintColor;
  //.....CONTANT VALUES
  //...DECORATION

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );
    final textStyle = GoogleFonts.roboto(fontSize: 13, color: hintColor);
    return SizedBox(
      width: width * fieldWidth,
      height: height * fieldHeight,
      child: TextFormField(
        textAlignVertical: textAlignment,
        validator: validator,
        controller: controller,
        style: textStyle,
        expands: expands,
        maxLines: null,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          hintText: hintText,
          hintStyle: textStyle,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
