//....UPLAOD IMAGE TILE
import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadImageTile extends StatelessWidget {
  final VoidCallback ontab;
  const UploadImageTile({super.key,required this.ontab});
  //....CONSTANT VLAUES
  static const _zeroPointOnePercent = 0.08;
  static const _zeroPointTwoPercent = 0.2;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return CustomFilledListTile(
      minTileHeight: height * _zeroPointTwoPercent,
      title: Column(
        children: [
          GestureDetector(
            onTap: ontab,
            child: Icon(
              Icons.cloud_upload_outlined,
              size: height * _zeroPointOnePercent,
            ),
          ),
          Text(
            'Upload image',
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
