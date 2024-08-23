import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContineWith extends StatelessWidget {
  final double width;
  const ContineWith({super.key, required this.width});
  static const _dividerWidthValue = 0.3;
  static const double _dividerThickness = 2;
  //fexbile widgets values
  static const _fiveFlex = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DividerWidget(
          widthSize: _dividerWidthValue,
          thickness: _dividerThickness,
        ),
        const Spacer(
          flex: _fiveFlex,
        ),
        SizedBox(
          width: width * _dividerWidthValue,
          child: Align(
            alignment: const Alignment(0.5, -0.95),
            child: Text(
              'Or continue with',
              style:
                  GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        const DividerWidget(
          widthSize: _dividerWidthValue,
          thickness: _dividerThickness,
        ),
      ],
    );
  }
}
