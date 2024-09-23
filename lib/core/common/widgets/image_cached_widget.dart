import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCachedWidget extends StatelessWidget {
  final String image;
  final bool isAvatar;
  const ImageCachedWidget(
      {super.key, required this.image, this.isAvatar = false});
  static const _normalFontSize = 12.0;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return switch (isAvatar) {
          true => CircleAvatar(
              maxRadius: 30,
              backgroundImage: imageProvider,
            ),
          false => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider),
              ),
            ),
        };
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: CircularProgressIndicator(
            value: progress.progress,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Text(
            'Error loading image',
            style: GoogleFonts.poppins(
              fontSize: _normalFontSize,
            ),
          ),
        );
      },
    );
  }
}
