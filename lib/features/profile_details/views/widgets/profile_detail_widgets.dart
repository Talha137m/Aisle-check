import 'package:aislecheck/core/common/widgets/circular_image_container.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings/app_colors.dart';

class UserPictureWidget extends StatelessWidget {
  const UserPictureWidget({super.key, required this.image});
  final String image;
  //...CONSTANT VALUES
  static const _iconWidth = 0.08;
  static const _iconHeight = 0.035;
  static const _iconBorderPadding = 0.002;
  static const _iconSize = 0.02;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      height: height * 0.13,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircularImageContainer(
            image: image,
          ),
          GestureDetector(
            onTap: () {
              context.showPopUpMsg('Pick Image');
            },
            child: CircularImageContainer(
              containerWidth: _iconWidth,
              containerHeight: _iconHeight,
              borderPadding: _iconBorderPadding,
              icon: Icon(
                Icons.edit,
                color: AppColors.whiteColor,
                size: height * _iconSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
