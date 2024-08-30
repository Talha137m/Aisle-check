import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

class CustomizedDropDownMenu extends StatefulWidget {
  const CustomizedDropDownMenu({super.key});

  @override
  State<CustomizedDropDownMenu> createState() => _CustomizedDropDownMenuState();
}

class _CustomizedDropDownMenuState extends State<CustomizedDropDownMenu> {
  var currentValue = 'English';
  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.roboto(
      fontSize: 14.0,
      color: AppColors.blackColor,
    );
    return DropdownButton(
      dropdownColor: AppColors.lightGreenColor,
      borderRadius: BorderRadius.circular(10.0),
      alignment: AlignmentDirectional.bottomStart,
      underline: const SizedBox(),
      value: currentValue,
      style: textStyle,
      icon: const Icon(
        Icons.keyboard_arrow_down,
      ),
      items: [
        DropdownMenuItem(
          value: 'English',
          onTap: () {
            setState(() {
              currentValue = 'English';
            });
          },
          child: Text(
            'English',
            style: textStyle,
          ),
        ),
        DropdownMenuItem(
          onTap: () {
            setState(() {
              currentValue = 'Hindi';
            });
          },
          value: 'Hindi',
          child: Text(
            'Hindi',
            style: textStyle,
          ),
        ),
      ],
      onChanged: (value) {},
    );
  }
}
