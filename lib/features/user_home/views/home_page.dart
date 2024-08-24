import 'package:aislecheck/core/common/widgets/customer_app_bar.dart';
import 'package:aislecheck/core/common/widgets/user_side_btn.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/shopping_list/views/shopping_list_page.dart';
import 'package:aislecheck/features/user_home/controllers/bottom_navigation_controller.dart';
import 'package:aislecheck/features/user_home/controllers/home_behaviour.dart';
import 'package:aislecheck/features/user_home/views/widgets/animated_bottom_nav_widgets/animated_navigatioin_bar.dart';
import 'package:aislecheck/features/user_home/views/widgets/user_home_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserHomePage extends StatelessWidget with HomeBehaviour {
  UserHomePage({super.key});
  static const String name = '/userHomePage';
  @override
  Widget build(BuildContext context) {
    var state = context.watch<BottomNavigationController>();
    return Scaffold(
      appBar: switch (state.currentIndex) {
        2 => const UserHomePageAppBar() as PreferredSizeWidget,
        1 => null,
        _ => const CustomerAppBar()
      },
      bottomNavigationBar: CurvedNavigationBar(
        index: state.currentIndex,
        backgroundColor: AppColors.bottomBgColor,
        items: const [
          Icon(Icons.explore, color: AppColors.inActiveBottomColors),
          Icon(Icons.list, color: AppColors.inActiveBottomColors),
          Icon(Icons.home, color: AppColors.inActiveBottomColors),
          Icon(Icons.notifications, color: AppColors.inActiveBottomColors),
          Icon(Icons.person, color: AppColors.inActiveBottomColors),
        ],
        onTap: (value) {
          context.read<BottomNavigationController>().changeState(value);
        },
      ),
      body: bottomWidgets[state.currentIndex],
    );
  }
}

class AllCategoriesWidget extends StatelessWidget {
  final String imgPath, category;
  const AllCategoriesWidget(
      {super.key, required this.imgPath, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.0,
        ), // Adjust the radius here
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset(
                imgPath,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              category,
              style:
                  GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class EnlargeCenterPage extends StatelessWidget {
  final double height, width;
  final String productName, offerName, howMuchDiscount, imgPath;
  final VoidCallback visitTab;
  const EnlargeCenterPage(
      {super.key,
      required this.imgPath,
      required this.visitTab,
      required this.height,
      required this.width,
      required this.offerName,
      required this.productName,
      required this.howMuchDiscount});
  static const _w05 = 0.05;
  static const _w25 = 0.25;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imgPath,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: const Alignment(-0.8, -0.8),
          children: [
            Text(
              productName,
              style: GoogleFonts.roboto(
                  color: AppColors.whiteColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.5),
              child: Text(
                offerName,
                style: GoogleFonts.roboto(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.2),
              child: Text(
                howMuchDiscount,
                style: GoogleFonts.roboto(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, 0.5),
              child: UserSideBtn(
                btnHeight: _w05,
                btnWidth: _w25,
                borderRadius: 30,
                onTap: visitTab,
                btnName: 'visit',
                btnBackgroundColor: AppColors.carsoulBtnColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriWidget extends StatelessWidget {
  final String category;
  final String subCategory;
  final Color subCategoryColor;
  final FontWeight subCategoryFontweight;
  final TextDecoration? textDecoration;
  const CategoriWidget(
      {super.key,
      required this.category,
      this.subCategory = 'See All',
      this.subCategoryColor = AppColors.black54Color,
      this.textDecoration,
      this.subCategoryFontweight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style:
                GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          Text(
            subCategory,
            style: GoogleFonts.roboto(
                color: subCategoryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: textDecoration),
          ),
        ],
      ),
    );
  }
}

//show the shops data
class ShopsWidget extends StatelessWidget {
  final double width, height;
  final String shopName, rating, shopDistance, imagPath;
  final VoidCallback goToShpsDetal;
  const ShopsWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.shopName,
      required this.shopDistance,
      required this.goToShpsDetal,
      required this.imagPath,
      required this.rating});
  static const _w5 = 0.5;
  static const _h15 = 0.15;
  static const _w04 = 0.04;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToShpsDetal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: width * _w5,
          child: Card(
            color: AppColors.whiteColor,
            child: Column(
              children: [
                Image.asset(
                  imagPath,
                  width: width * _w5,
                  height: height * _h15,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            shopName,
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const Icon(
                          Icons.star_rate,
                          color: AppColors.ratingStartColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: width * _w04,
                          child: FittedBox(
                            child: Text(
                              rating,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.blackColor,
                          size: 20,
                        ),
                        Expanded(
                          child: Text(
                            shopDistance,
                            style: GoogleFonts.roboto(
                                fontSize: 10, fontWeight: FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
