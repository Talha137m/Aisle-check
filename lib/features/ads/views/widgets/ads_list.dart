import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/ads/models/ad.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//........ADS LIST
class AdsList extends StatelessWidget {
  const AdsList({super.key, required this.ads});
  final List<AdModel> ads;
  //....CONSTANT VALUES
  static const _padding = 0.03;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ads.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * _padding,
        ),
        child: AdItemView(
          ad: ads[index],
        ),
      ),
    );
  }
}

//.....AD ITEM VIEW
class AdItemView extends StatelessWidget {
  const AdItemView({super.key, required this.ad});
  final AdModel ad;
  //....CONSTANT VALUES
  static const _status = 'Status : ';
  static const _imageBorderRadius = 10.0;
  static const _zeroPointThree = 0.3;
  static const _nameFontSize = 15.0;
  static const _statusFontSize = 14.0;
  static const _maxLines = 1;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexThree = 3;
  static const _flexFive = 5;
  static const _flexSix = 6;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      height: height * _zeroPointThree,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: _flexFive,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                _imageBorderRadius,
              ),
              child: Image.asset(
                ad.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: _flexOne,
            child: Row(
              children: [
                Expanded(
                  flex: _flexSix,
                  child: Text(
                    ad.description,
                    maxLines: _maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: _nameFontSize,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: _flexThree,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _status,
                              style: GoogleFonts.roboto(
                                fontSize: _statusFontSize,
                                color: AppColors.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: ad.status,
                              style: GoogleFonts.roboto(
                                  fontSize: _statusFontSize,
                                  color: ad.status == 'Active'
                                      ? AppColors.greenColor
                                      : AppColors.redColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
