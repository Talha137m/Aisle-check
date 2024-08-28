import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/browse_shops/views/widgets/find_shop_location_btn.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrowseShopItem extends StatelessWidget {
  final double width, height;
  final String imagesPath;
  final String shopNme;
  final String shopAddress;
  final String shopDistance;
  final double shopRating;
  final VoidCallback findShopLocationTab;
  const BrowseShopItem(
      {super.key,
      required this.width,
      required this.height,
      required this.imagesPath,
      required this.shopAddress,
      required this.shopDistance,
      required this.shopRating,
      required this.findShopLocationTab,
      required this.shopNme});
  static const _w9 = 0.9;
  static const _h2 = 0.2;
  static const _w02 = 0.02;
  static const _w03 = 0.03;
  static const _h15 = 0.15;
  static const _w3 = 0.3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width * _w9,
        height: height * _h2,
        child: Card(
          child: Row(
            children: [
              SizedBox(
                width: width * _w02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagesPath,
                  width: width * _w3,
                  height: height * _h15,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: width * _w03,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              shopNme,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                              maxLines: 1,
                            ),
                          ),
                          Expanded(
                            child: RatingBar.readOnly(
                              size: 15,
                              filledColor: AppColors.greenColor,
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              initialRating: shopRating,
                              maxRating: 5,
                            ),
                          )
                        ],
                      ),
                    ),
                    //const Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          Expanded(
                            child: Text(
                              shopAddress,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              shopDistance,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                              maxLines: 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: findShopLocationTab,
                            child: const FindShopLocationBtn(),
                          ),
                          //Spacer(),
                        ],
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
