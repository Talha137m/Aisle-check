import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double thickness;
  final double widthSize;
  const DividerWidget({super.key, this.thickness = 5, this.widthSize = 0.40});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width * widthSize,
      child: Divider(
        indent: 0.5,
        thickness: thickness,
        color: AppColors.blackColor,
      ),
    );
  }
}
