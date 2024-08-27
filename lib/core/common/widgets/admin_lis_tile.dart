import 'package:flutter/material.dart';

import '../../constants/strings/app_colors.dart';

class CustomFilledListTile extends StatelessWidget {
  const CustomFilledListTile(
      {super.key,
      this.leading,
      this.trailing,
      this.minLeadingWidth,
      this.title,
      this.minTileHeight});
  final Widget? leading, trailing, title;
  final double? minLeadingWidth, minTileHeight;
  //...CONTANT VALUES
  static const _borderWidth = 0.0;
  static const _borderRadius = 30.0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: minTileHeight,
      minLeadingWidth: minLeadingWidth,
      leading: leading,
      title: title,
      trailing: trailing,
      shape: ContinuousRectangleBorder(
        side: const BorderSide(
          color: AppColors.greenColor,
          width: _borderWidth,
        ),
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ),
      ),
      selected: true,
      selectedTileColor: AppColors.lightGreenColor,
    );
  }
}