import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectProducts extends StatelessWidget {
  const SelectProducts({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey, width: 0.5),
      ),
      activeColor: AppColors.greenColor,
      value: '',
      groupValue: '',
      onChanged: (value) {},
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}