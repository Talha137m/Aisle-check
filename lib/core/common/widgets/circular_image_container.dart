import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';

class CircularImageContainer extends StatelessWidget {
  const CircularImageContainer({
    super.key,
    this.containerWidth = 0.25,
    this.containerHeight = 0.15,
    this.shouldHaveAShadow = true,
    this.borderPadding = 0.008,
    this.image,
    this.icon,
  });
  final String? image;
  final double containerWidth, containerHeight, borderPadding;
  final bool shouldHaveAShadow;
  final Icon? icon;
  //CONSTANT VALUES
  static const _blurAndSpreadRadius = 2.0;
  static const _shadowOffset = Offset(1, 1);
  static const _avatarRadius = 0.04;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      width: width * containerWidth,
      height: height * containerHeight,
      padding: EdgeInsets.all(
        height * borderPadding,
      ),
      decoration: BoxDecoration(
        boxShadow: shouldHaveAShadow
            ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: _blurAndSpreadRadius,
                  spreadRadius: _blurAndSpreadRadius,
                  offset: _shadowOffset,
                )
              ]
            : null,
        color: AppColors.whiteColor,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: height * _avatarRadius,
        backgroundColor: AppColors.greenColor,
        backgroundImage: image == null
            ? null
            : AssetImage(
                image!,
              ),
        child: icon,
      ),
    );
  }
}
