import 'package:flutter/material.dart';

import '../../../core/constants/strings/app_colors.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({super.key, required this.icon, required this.text});
  final String icon, text;
  //...CONSTANT VALUES
  static const _containerWidth = 0.85;
  static const _containerHeight = 0.8;
  static const _contentPadding = 0.05;
  static const _borderRadius = 10.0;
  static const _imageWidthAndHeight = 0.2;
  static const _fontSize = 0.1;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxWidth, :maxHeight) = constraints;
        return Center(
          child: Container(
            padding: EdgeInsets.all(maxHeight * _contentPadding),
            width: maxWidth * _containerWidth,
            height: maxHeight * _containerHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: AppColors.lightGreenColor,
                border: Border.all(
                  color: AppColors.greenColor,
                )),
            child: Column(
              children: [
                Expanded(
                  flex: _flexTwo,
                  child: Image.asset(
                    width: maxWidth * _imageWidthAndHeight,
                    height: maxHeight * _imageWidthAndHeight,
                    icon,
                  ),
                ),
                Expanded(
                  flex: _flexOne,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: maxHeight * _fontSize,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
